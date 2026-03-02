Deployment Plan — Docker Hub → VPS
1. One-Time Setup (Local Machine)
Install Docker Desktop
Create a Docker Hub account at hub.docker.com
Log in from terminal:
docker login
Create a repository on Docker Hub (e.g. your-username/your-app)

2. One-Time Setup (VPS)
2.1 Install Docker
sudo apt update && sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl enable docker && sudo systemctl start docker

2.2 Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

2.3 Log In to Docker Hub on VPS
docker login

2.4 Create docker-compose.yml
Create this file in /home/your-user/app/docker-compose.yml

mkdir -p ~/app && nano ~/app/docker-compose.yml

Paste the following:

version: '3.8'
services:
  app:
    image: your-username/your-app:latest
    restart: always
    expose:
      - '3000'
    networks:
      - webnet
  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
      - /etc/letsencrypt:/etc/letsencrypt:ro
    depends_on:
      - app
    networks:
      - webnet
networks:
  webnet:

2.5 Create Nginx Config
nano ~/app/nginx.conf

Paste the following (replace yourdomain.com):

server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name yourdomain.com www.yourdomain.com;

    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;

    location / {
        proxy_pass http://app:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

2.6 Point Squarespace Domain to VPS
Do this before running Certbot — DNS must be pointing to your VPS first.

Log in to Squarespace → Domains → DNS Settings
Delete any existing A records for @ and www
Add a new A record:  Host: @   Value: your-vps-ip   TTL: 3600
Add a new A record:  Host: www   Value: your-vps-ip   TTL: 3600
Wait for DNS to propagate (can take up to 30 min — check at dnschecker.org)

2.7 Set Up SSL with Certbot
Run Certbot before starting Docker so it can use port 80 freely.

sudo apt install -y certbot
sudo certbot certonly --standalone -d yourdomain.com -d www.yourdomain.com

Certificates are saved to /etc/letsencrypt/live/yourdomain.com/

2.8 Configure Firewall (UFW)
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
sudo ufw status

2.9 Start Everything
cd ~/app
docker-compose pull
docker-compose up -d

3. Every Deployment (Local → Docker Hub → VPS)
Run these steps each time you want to deploy a new version.

Step 1 — Build the image (local):
docker build -t your-username/your-app:latest .

Step 2 — Push to Docker Hub (local):
docker push your-username/your-app:latest

Step 3 — SSH into VPS and update:
ssh user@your-vps-ip
cd ~/app
docker-compose pull
docker-compose up -d

4. Ongoing Maintenance
Clean up old images:  docker image prune -a
Store secrets in ~/app/.env — never bake them into the image
Test SSL auto-renew:  sudo certbot renew --dry-run
Update VPS packages:  sudo apt update && sudo apt upgrade -y