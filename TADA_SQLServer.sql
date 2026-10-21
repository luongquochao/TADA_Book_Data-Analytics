USE TADA_Book_Analysis;
GO

/* =========================================================
   TASK 3 - TRUY VẤN DỮ LIỆU VỚI SQL SERVER
   Table: dbo.tada_books
   ========================================================= */

/* PART 0 - KIỂM TRA */
SELECT COUNT(*) AS total_rows
FROM tada_books;
GO

SELECT TOP 10 *
FROM dbo.tada_books;
GO

/* PART 1 - KHÁM PHÁ */

/* 1. Top 10 sách bán chạy */
SELECT TOP 10
    product_id, title, authors, category, quantity, revenue
FROM tada_books
ORDER BY quantity DESC;
GO

/* 2. Top 10 sách có doanh thu cao nhất */
SELECT TOP 10
    product_id, title, authors, category,
    quantity, current_price, revenue
FROM tada_books
ORDER BY revenue DESC;
GO

/* 3. Rating >= 4.8 và hơn 100 lượt review */
SELECT
    product_id, title, authors, category,
    avg_rating, n_review, quantity, revenue
FROM tada_books
WHERE avg_rating >= 4.8
  AND n_review > 100
ORDER BY avg_rating DESC, n_review DESC;
GO

/* PART 2 - TỔNG HỢP */

/* 4. Doanh thu và số lượng theo thể loại */
SELECT
    category,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT product_id) AS number_of_titles
FROM tada_books
GROUP BY category
ORDER BY total_revenue DESC;
GO

/* 5. Hiệu quả theo nhà xuất bản/manufacturer */
SELECT
    manufacturer,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity,
    COUNT(DISTINCT product_id) AS number_of_titles,
    AVG(avg_rating) AS average_rating
FROM tada_books
GROUP BY manufacturer
ORDER BY total_revenue DESC;
GO

/* 6. Hiệu quả theo phân khúc giá */
SELECT
    price_segment,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT product_id) AS number_of_titles,
    AVG(current_price) AS average_price
FROM tada_books
GROUP BY price_segment
ORDER BY total_revenue DESC;
GO

/* PART 3 - NÂNG CAO */

/* 7. CASE WHEN: phân nhóm độ phổ biến theo n_review */
WITH popularity AS (
    SELECT
        product_id,
        n_review,
        quantity,
        revenue,
        CASE
            WHEN ISNULL(n_review, 0) = 0 THEN N'Chưa có đánh giá'
            WHEN n_review <= 100 THEN N'Ít đánh giá'
            WHEN n_review <= 500 THEN N'Trung bình'
            ELSE N'Nhiều đánh giá'
        END AS popularity_group
    FROM tada_books
)
SELECT
    popularity_group,
    COUNT(*) AS number_of_titles,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    CAST(
        100.0 * COUNT(*) /
        NULLIF((SELECT COUNT(*) FROM tada_books), 0)
        AS DECIMAL(10,2)
    ) AS title_percentage
FROM popularity
GROUP BY popularity_group
ORDER BY total_quantity DESC;
GO

/* 8. Hiệu quả theo nhóm rating */
SELECT
    rating_group,
    COUNT(DISTINCT product_id) AS number_of_titles,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    AVG(avg_rating) AS average_rating
FROM tada_books
GROUP BY rating_group
ORDER BY total_revenue DESC;
GO

/* 9. Hiệu quả theo độ dày sách */
SELECT
    page_segment,
    COUNT(DISTINCT product_id) AS number_of_titles,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue,
    AVG(pages) AS average_pages
FROM tada_books
GROUP BY page_segment
ORDER BY total_revenue DESC;
GO

/* 10. Mức giảm giá theo phân khúc giá */
SELECT
    price_segment,
    COUNT(DISTINCT product_id) AS number_of_titles,
    AVG(discount_percent) AS average_discount_percent,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM tada_books
GROUP BY price_segment
ORDER BY total_quantity DESC;
GO

/* PART 4 - BUSINESS QUESTIONS BỔ SUNG */

/* 11. Top sách theo rating */
SELECT TOP 20
    product_id, title, avg_rating,
    n_review, quantity, revenue
FROM tada_books
WHERE avg_rating IS NOT NULL
ORDER BY avg_rating DESC, quantity DESC;
GO

/* 12. Top 20 sách có tỷ lệ giảm giá cao nhất */
SELECT TOP 20
    product_id, title,
    original_price, current_price,
    discount_percent, quantity, revenue
FROM tada_books
ORDER BY discount_percent DESC;
GO

/* 13. Manufacturer có ít nhất 5 đầu sách */
SELECT
    manufacturer,
    COUNT(DISTINCT product_id) AS number_of_titles,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM tada_books
GROUP BY manufacturer
HAVING COUNT(DISTINCT product_id) >= 5
ORDER BY total_revenue DESC;
GO
