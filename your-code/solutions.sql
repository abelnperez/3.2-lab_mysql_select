/* Challenge 1 - Who Have Published What At Where? */
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN
	titles ON titleauthor.title_id = titles.title_id
		INNER JOIN
	publishers ON titles.pub_id = publishers.pub_id;
    
/* Challenge 2 - Who Have Published How Many At Where? */
    
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
	publishers.pub_name AS 'PUBLISHER',
    count(titles.title) AS 'TITLE COUNT'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN
	titles ON titleauthor.title_id = titles.title_id
		INNER JOIN
	publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

/* Challenge 3 - Best Selling Authors */

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    count(sales.qty) AS 'TOTAL'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN
	titles ON titleauthor.title_id = titles.title_id
		INNER JOIN
	sales ON titles.title_id = sales.title_id
    
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 'TOTAL' DESC
LIMIT 3;

/* Challenge 4 - Best Selling Authors Ranking */

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    count(sales.qty) AS 'TOTAL'
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles ON titleauthor.title_id = titles.title_id
		LEFT JOIN
	sales ON titles.title_id = sales.title_id
    
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY 'TOTAL' DESC;