CREATE ROLE hozen LOGIN PASSWORD 'hozen#1qaz';
CREATE DATABASE hozen
    WITH ENCODING 'UTF8'
        LC_COLLATE 'ja_JP.UTF-8'
        LC_CTYPE 'ja_JP.UTF-8'
        TEMPLATE template0;
GRANT ALL ON DATABASE hozen TO hozen;