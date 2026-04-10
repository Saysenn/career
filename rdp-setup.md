# RDP Setup

1. Set default browser to Chrome
2. Install Node.js (Windows), Windsurf / VS Code (Windows), Git (Windows)
3. Open and set up Windsurf account
4. Configure Git globals:
   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "your@email.com"
   ```
5. Clone the website repo:
   - `git clone <repo-url>`
   - Log in to GitHub when prompted
6. Ensure hosting is bought ( hostinger for coming soon and maintenance wordpress pages, vercel free for nextjs full website) ( up to you what to use on full website )
7. Ensure domain is bought ( squarespace, namecheap, z.com, cloudflare)
8. Ensure workspace (Google Workspace) is bought
9. Set up Resend — see `docs/email-setup/resend.md`
10. Set up Google reCAPTCHA (any version) or Cloudflare Turnstile
11. the rest is up to you on how to secure and make things work. I usually develop on my device then be a collaborator of the company repo then push my changes in their repo and then it wil automatically be deployed on vercel ( downside is the company need to fetch and pull and push to make everything live thats how secured it is)
12. I advise you created your own full website template, ensure it have captchas, secured form and different layouts for header, footer, modals for cookies and also have prepared GDPR and UK compliances pages.
13. I also recommend securing dns records for emails and cleaning up dns records for emails and other services.