create table logs_data
(
    id         uuid not null
        primary key,
    created_at timestamp,
    datapoint  integer,
    log_type   text
);

alter table logs_data
    owner to otel;

INSERT INTO logs_data (id, created_at, datapoint, log_type)
VALUES (gen_random_uuid(), current_timestamp, 1, 'db');
INSERT INTO logs_data (id, created_at, datapoint, log_type)
VALUES (gen_random_uuid(), current_timestamp, 2, 'web');
INSERT INTO logs_data (id, created_at, datapoint, log_type)
VALUES (gen_random_uuid(), current_timestamp, 4, 'app');
INSERT INTO logs_data (id, created_at, datapoint, log_type)
VALUES (gen_random_uuid(), current_timestamp, 4, 'app');
