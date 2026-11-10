USE help_desk;

SELECT p.priority_name, COUNT(*) AS open_tickets
FROM tickets t
JOIN priorities p ON t.priority_id = p.priority_id
WHERE t.status IN ('Open', 'In Progress')
GROUP BY p.priority_name;

SELECT c.category_name,
       ROUND(AVG(TIMESTAMPDIFF(HOUR, t.opened_at, t.resolved_at)), 1) AS avg_hours
FROM tickets t
JOIN categories c ON t.category_id = c.category_id
WHERE t.resolved_at IS NOT NULL
GROUP BY c.category_name
ORDER BY avg_hours DESC;

SELECT t.ticket_id, t.title, p.priority_name, p.target_hours,
       TIMESTAMPDIFF(HOUR, t.opened_at, t.resolved_at) AS hours_taken
FROM tickets t
JOIN priorities p ON t.priority_id = p.priority_id
WHERE t.resolved_at IS NOT NULL
  AND TIMESTAMPDIFF(HOUR, t.opened_at, t.resolved_at) > p.target_hours
ORDER BY hours_taken DESC;

SELECT te.full_name, COUNT(*) AS total_tickets
FROM tickets t
JOIN technicians te ON t.technician_id = te.technician_id
GROUP BY te.full_name
ORDER BY total_tickets DESC;

-- Q5: Open tickets past their target time.
SELECT t.ticket_id, t.title, p.priority_name, p.target_hours,
       TIMESTAMPDIFF(HOUR, t.opened_at, NOW()) AS hours_open
FROM tickets t
JOIN priorities p ON t.priority_id = p.priority_id
WHERE t.status IN ('Open', 'In Progress')
  AND TIMESTAMPDIFF(HOUR, t.opened_at, NOW()) > p.target_hours
ORDER BY hours_open DESC;