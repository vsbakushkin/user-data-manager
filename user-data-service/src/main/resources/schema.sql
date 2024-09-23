CREATE TABLE IF NOT EXISTS users
(
    id         BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    email      VARCHAR(255) UNIQUE                     NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE             NOT NULL,
    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT uq_users_email UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS user_activities
(
    id            BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    status        VARCHAR(50)                             NOT NULL,
    user_id       BIGINT                                  NOT NULL,
    activity_time TIMESTAMP WITHOUT TIME ZONE             NOT NULL,
    CONSTRAINT fk_messages_to_users FOREIGN KEY (user_id)
        REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS service_activities
(
    id            BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    status        VARCHAR(50)                             NOT NULL,
    service_id    BIGINT                                  NOT NULL,
    activity_time TIMESTAMP WITHOUT TIME ZONE             NOT NULL
);

CREATE TABLE IF NOT EXISTS messages
(
    id          BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    content     VARCHAR(500)                            NOT NULL,
    user_id     BIGINT                                  NOT NULL,
    received_at TIMESTAMP WITHOUT TIME ZONE             NOT NULL,
    CONSTRAINT pk_messages PRIMARY KEY (id),
    CONSTRAINT fk_messages_to_users FOREIGN KEY (user_id)
        REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);