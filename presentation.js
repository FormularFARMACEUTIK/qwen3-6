// routes/presentations.js (Express)
app.get('/api/presentations', async (req, res) => {
  try {
    // In production: query your database where you've pre-synced repository metadata
    // For demo: aggregate from live APIs (add caching in production!)
    
    const [figshareItems, zenodoItems] = await Promise.allSettled([
      fetchFigshareCollection('IPR-CAD-Videos'), // Your Figshare collection ID
      fetchZenodoCommunity('ipr-cad') // Your Zenodo community
    ]);
    
    const presentations = [
      ...(figshareItems.status === 'fulfilled' ? figshareItems.value.map(item => ({
        id: item.id,
        type: 'video',
        title: item.title,
        doi: item.doi,
        authors: item.authors,
        repository: 'Figshare',
        orcid: item.authors?.[0]?.orcid // If collected during submission
      })) : []),
      ...(zenodoItems.status === 'fulfilled' ? zenodoItems.value.map(item => ({
        id: item.id,
        type: 'poster',
        title: item.title,
        doi: item.doi,
        authors: item.creators,
        repository: 'Zenodo',
        orcid: item.creators?.[0]?.orcid
      })) : [])
    ];
    
    res.json(presentations.slice(0, req.query.limit || 10));
    
  } catch (error) {
    console.error('Presentation fetch error:', error);
    res.status(500).json({ error: 'Failed to load presentations' });
  }
});
