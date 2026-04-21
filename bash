# Save as index.html and deploy to any PaaS:
vercel --prod
# or
netlify deploy --prod
# or
firebase deploy
# ORCID Configuration
ORCID_CLIENT_ID=APP-XXXXXXXXXXXXXXXX
ORCID_CLIENT_SECRET=your-client-secret-here
ORCID_REDIRECT_URI=https://ipr-cad.scientia-naturalis.org/auth/orcid/callback

# Session Security
SESSION_SECRET=your-strong-random-secret-min-32-chars
NODE_ENV=production

# Repository API Keys (optional, for metadata enrichment)
FIGSHARE_TOKEN=your-figshare-api-token
ZENODO_TOKEN=your-zenodo-api-token
# Test redirect
curl -I "https://your-domain/auth/orcid/login"

# Test callback (use ORCID sandbox)
# Visit: https://sandbox.orcid.org/oauth/authorize?client_id=YOUR_ID&response_type=code&scope=/authenticate&redirect_uri=YOUR_CALLBACK
