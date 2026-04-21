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
