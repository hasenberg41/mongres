SELECT
  c.id,
  c.title,
  p.name AS person_name,
  d.name AS document_name,
  d.description,
  d.link_to_data AS document_link,
  c.created_at
FROM contracts c
JOIN people p ON c.people_id = p.id
JOIN documents d ON c.documents_id = d.id
