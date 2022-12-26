DROP DATABASE exam_fastapi_db;
DROP DATABASE test_exam_fastapi_db;
DROP ROLE exam_fastapi_db_user01;
CREATE ROLE exam_fastapi_db_user01 WITH LOGIN PASSWORD 'VvUYdElq8QzdgYD3';
ALTER ROLE exam_fastapi_db_user01 CREATEDB;
CREATE DATABASE exam_fastapi_db OWNER = exam_fastapi_db_user01 TEMPLATE = template0 ENCODING = 'UTF8';
CREATE DATABASE output_scatter_graph_db OWNER = exam_fastapi_db_user01 TEMPLATE = template0 ENCODING = 'UTF8';
