GRANT ALL PRIVILEGES ON kea.* TO 'keauser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON kea.* TO 'keauser'@'172.18.0.11' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON auth.* TO 'keauser'@'172.18.0.11' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON kea.* TO 'keauser'@'172.18.0.20' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON kea.* TO 'keauser'@'172.18.0.21' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON kea.* TO 'keauser'@'172.18.0.22' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
