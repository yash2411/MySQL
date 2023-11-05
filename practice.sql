SELECT users.id, username, count(*) AS num_like FROM users
JOIN likes ON users.id = likes.user_id
WHERE num_like = (SELECT count(*) FROM photos)
GROUP BY likes.user_id