
# 📚 TADA BOOK — Phân tích dữ liệu và dự báo sách bán chạy

**Dự án phân tích dữ liệu toàn diện nhằm khám phá đặc điểm kinh doanh của danh mục sách, xác định các yếu tố liên quan đến Bestseller và đề xuất giải pháp hỗ trợ ra quyết định dựa trên dữ liệu.**

## 📌 1. Tổng quan dự án

TADA BOOK là dự án phân tích dữ liệu tập trung vào danh mục sách, giá bán, mức giảm giá, đánh giá của khách hàng, danh mục sản phẩm, nhà xuất bản và tình trạng sách bán chạy.

Dự án được triển khai theo quy trình phân tích dữ liệu từ làm sạch, truy vấn, trực quan hóa đến xây dựng mô hình Machine Learning và đề xuất giải pháp kinh doanh.

**Định hướng chính:**

> Mô tả dữ liệu → Dự báo Bestseller → Đề xuất giải pháp kinh doanh

Mục tiêu cuối cùng không chỉ là trình bày số liệu mà còn chuyển hóa kết quả phân tích thành thông tin có giá trị, hỗ trợ doanh nghiệp đưa ra quyết định về sản phẩm, giá bán và hoạt động marketing.

## 🎯 2. Mục tiêu dự án

- Tìm hiểu cấu trúc, đặc điểm và chất lượng dữ liệu sách.
- Làm sạch và chuẩn hóa dữ liệu nhằm nâng cao tính nhất quán.
- Phân tích giá bán, mức giảm giá, điểm đánh giá, danh mục sách và nhà xuất bản.
- Xác định các đặc điểm có liên quan đến tình trạng Bestseller.
- Xây dựng mô hình Machine Learning để dự báo khả năng một cuốn sách thuộc nhóm Bestseller.
- Trực quan hóa kết quả bằng Power BI.
- Đề xuất các hành động kinh doanh dựa trên insight và kết quả phân tích.

## 🛠️ 3. Công nghệ và công cụ sử dụng

| Công cụ | Mục đích sử dụng |
|---|---|
| SQL Server | Truy vấn, tổng hợp và phân tích dữ liệu |
| Python | Tiền xử lý dữ liệu, EDA và Machine Learning |
| Pandas | Làm sạch, biến đổi và xử lý dữ liệu |
| Matplotlib / Seaborn | Trực quan hóa dữ liệu, nếu được sử dụng trong Notebook |
| Scikit-learn | Xây dựng và đánh giá mô hình Machine Learning, nếu được sử dụng |
| Power BI | Xây dựng dashboard, KPI và trực quan hóa insight |

*Danh sách thư viện cần được đối chiếu với Notebook thực tế trước khi công bố.*

## 🔄 4. Quy trình thực hiện dự án

### 4.1. Tìm hiểu và làm sạch dữ liệu

Thực hiện kiểm tra cấu trúc dữ liệu, kiểu dữ liệu, giá trị thiếu, dữ liệu trùng lặp và tính nhất quán của các trường thông tin.

Các bước tiền xử lý bao gồm:

- Chuẩn hóa văn bản ở các trường danh mục, nhà sản xuất và tác giả.
- Loại bỏ khoảng trắng thừa ở đầu, cuối và giữa các từ.
- Thống nhất cách viết để hạn chế việc cùng một đối tượng bị phân loại thành nhiều giá trị khác nhau.
- Tạo biến `discount_percent` để biểu diễn tỷ lệ giảm giá.
- Chuẩn bị biến mục tiêu `is_bestseller` phục vụ bài toán phân loại.

### 4.2. Phân tích dữ liệu bằng SQL Server

Sử dụng SQL Server để truy vấn, tổng hợp và trả lời các câu hỏi kinh doanh liên quan đến danh mục sách.

Các hướng phân tích chính:

- Cơ cấu sản phẩm theo danh mục và nhà xuất bản/nhà sản xuất.
- Phân bố giá bán, tỷ lệ giảm giá và điểm đánh giá.
- So sánh đặc điểm giữa các nhóm sách.
- Phân tích tình trạng Bestseller theo các thuộc tính có sẵn.
- Tổng hợp các chỉ số hỗ trợ đánh giá hiệu quả danh mục sản phẩm.

### 4.3. Phân tích khám phá dữ liệu (EDA) bằng Python

Sử dụng Python để khám phá phân phối dữ liệu, mối quan hệ giữa các biến và các xu hướng tiềm năng.

Một số hướng phân tích:

- Phân phối giá bán và điểm đánh giá.
- Mối quan hệ giữa giá bán và doanh số, nếu dữ liệu doanh số có sẵn.
- So sánh các nhóm danh mục và nhà xuất bản.
- Khám phá sự khác biệt giữa sách Bestseller và Non-Bestseller.
- Hình thành giả thuyết về các yếu tố có thể liên quan đến khả năng bán chạy.

Kết quả EDA là cơ sở để xác định các vấn đề cần nghiên cứu sâu hơn và chuẩn bị dữ liệu cho mô hình dự báo.

### 4.4. Xây dựng mô hình Machine Learning

Triển khai bài toán **phân loại nhị phân (Binary Classification)** nhằm dự báo tình trạng Bestseller.

**Các mô hình được nghiên cứu:**

- Logistic Regression
- Random Forest Classifier

**Các chỉ số đánh giá:**

- Accuracy
- Precision
- Recall
- F1-score
- Confusion Matrix
- Feature Importance, đối với mô hình hỗ trợ phân tích tầm quan trọng của đặc trưng

Phân tích kết quả nhằm đánh giá khả năng dự báo của mô hình và tìm hiểu những đặc điểm có đóng góp vào việc phân biệt hai nhóm Bestseller và Non-Bestseller.

Lưu ý: kết quả dự báo phản ánh các mẫu hình trong dữ liệu được sử dụng. Mô hình không đảm bảo doanh số tương lai và không tự chứng minh quan hệ nhân quả.

### 4.5. Trực quan hóa bằng Power BI

Xây dựng dashboard nhằm trình bày các chỉ số tổng quan và hỗ trợ khám phá dữ liệu theo nhiều góc độ.

Các nội dung phân tích hướng đến:

- Tổng quan danh mục sách.
- So sánh giữa các danh mục và nhà xuất bản.
- Phân tích giá bán và mức giảm giá.
- Khám phá điểm đánh giá và tình trạng Bestseller.
- Trình bày các kết quả phân tích theo hướng dễ hiểu, hỗ trợ ra quyết định.

Dashboard đóng vai trò kết nối kết quả phân tích dữ liệu với nhu cầu theo dõi và đánh giá hoạt động kinh doanh.

## 💡 5. Giá trị kinh doanh và định hướng hành động

Dựa trên kết quả phân tích thực tế, doanh nghiệp có thể xem xét các hướng hành động sau:

### Chiến lược giá và giảm giá

Phân tích hiệu quả của các mức giá và tỷ lệ giảm giá để xác định nhóm sản phẩm cần được nghiên cứu sâu hơn.

### Tối ưu hoạt động marketing

Sử dụng đặc điểm sản phẩm và kết quả phân tích Bestseller để hỗ trợ lựa chọn nhóm sách tiềm năng cho các chiến dịch marketing.

### Quản lý danh mục sản phẩm

So sánh các danh mục và nhà xuất bản để xác định nhóm sản phẩm có hiệu quả nổi bật hoặc cần được đánh giá thêm.

### Hỗ trợ ra quyết định bằng dữ liệu

Sử dụng mô hình dự báo như một nguồn thông tin tham khảo để ưu tiên rà soát sản phẩm, kết hợp với dữ liệu doanh số, tồn kho, biên lợi nhuận và hiệu quả chiến dịch trước khi triển khai hành động.

*Các hướng hành động trên là định hướng đề xuất. Hiệu quả thực tế cần được kiểm chứng bằng dữ liệu vận hành và kết quả kinh doanh.*

## 📂 6. Cấu trúc sản phẩm bàn giao

Repository bao gồm các thành phần chính:

| Thành phần | Nội dung |
|---|---|
| SQL Server (`.sql`) | Các câu truy vấn và phân tích dữ liệu |
| Python Notebook (`.ipynb`) | Tiền xử lý, EDA, trực quan hóa và Machine Learning |
| Power BI (`.pbix`) | Dashboard báo cáo và khám phá dữ liệu |

Bạn có thể mở Notebook để xem quy trình xử lý và phân tích, tham khảo file SQL để kiểm tra logic truy vấn, hoặc sử dụng Power BI Desktop để tương tác với dashboard.

## 📈 7. Kết quả và bài học kinh nghiệm

Thông qua dự án, tôi có cơ hội thực hành quy trình phân tích dữ liệu từ đầu đến cuối:

- Làm sạch dữ liệu và xây dựng đặc trưng.
- Truy vấn và tổng hợp dữ liệu bằng SQL Server.
- Phân tích khám phá dữ liệu bằng Python.
- Xây dựng và đánh giá mô hình phân loại.
- Thiết kế dashboard và trình bày insight bằng Power BI.
- Chuyển hóa câu hỏi phân tích thành các định hướng hành động kinh doanh.

Dự án thể hiện khả năng kết hợp kỹ năng kỹ thuật với tư duy phân tích nhằm hỗ trợ ra quyết định dựa trên dữ liệu.

## 👤 8. Tác giả

**Lương Quốc Hào**

Định hướng nghề nghiệp: Data Analyst

- GitHub: [luongquochao](https://github.com/luongquochao)
- Dự án: [TADA BOOK — Data Analytics](https://github.com/luongquochao/TADA_Book_Data-Analytics)

---

*Dự án được thực hiện nhằm thực hành và trình bày năng lực phân tích dữ liệu. Các kết luận và khuyến nghị cần được đánh giá dựa trên kết quả thực tế và bối cảnh kinh doanh trước khi áp dụng.*
