/* Написать скрипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)
*/
USE vk;

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
	id SERIAL, 
	from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS chats;
CREATE TABLE chats(
	id SERIAL,
	name VARCHAR(150),
	chat_admin_user_id BIGINT UNSIGNED NOT NULL,
	
	INDEX chats_name_idx(name), 
	foreign key (chat_admin_user_id) references users(id)
);

DROP TABLE IF EXISTS music;
CREATE TABLE music(
	id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255),
    size INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id)
);
    
    