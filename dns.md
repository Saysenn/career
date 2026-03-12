**Summary — DNS for Google Workspace Email**

### MX (Mail Routing)

```
MX  @   1   ASPMX.L.GOOGLE.COM
MX  @   1   smtp.google.com
MX  @   5   ALT1.ASPMX.L.GOOGLE.COM
MX  @   5   ALT2.ASPMX.L.GOOGLE.COM
MX  @  10   ALT3.ASPMX.L.GOOGLE.COM
MX  @  10   ALT4.ASPMX.L.GOOGLE.COM
```

### SPF

```
TXT  @  v=spf1 include:_spf.google.com ~all
```

### DKIM

```
TXT  google._domainkey  v=DKIM1;k=rsa;p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAle2OTpE7/SLM06YhRyBxloKIVLymbcWhM6VJQY3ika5tSWKAkPFNGPUe27cSvXMWgIQcnTakYi4HzV35KaW/51mnnuTNJkKDUVfgFNIkI9hxVbwe4KwJM00h/MGUpONHVcooSL/xWdceb4sjLiJUp8o/RNnRJra9/LPOs0tBn+rxyiv39pah1gfbvQ98zW9mm3yKYqjDJaAuGY0nxIetGRW4zSPpPZeAXW+X3b9LcjGwZvPDd/zzermHclmcWimQnSxGfbor16Ya5Q7GfMwSvkuGx90CDuk7tPwpQMrX2RMfK6y5UOaibcLRGpF/EInb7A4AXrLY3yLB7X+mUHbcywIDAQAB
```

### DMARC

```
TXT  _dmarc  v=DMARC1; p=none
```

