--ALTER TABLE user_contacts ADD CONSTRAINT user_contacts_client_id_check CHECK (client_id >= 0);
--ALTER TABLE user_contacts ALTER COLUMN client_id SET NOT NULL
ALTER TABLE user_contacts ALTER COLUMN phone SET NOT NULL

--ALTER TABLE [название таблицы] [тип ограничения — FOREIGN KEY] ([поле в таблице]) REFERENCES [название таблицы-источника] ([название поля-источника]);

--ALTER TABLE user_contacts ADD CONSTRAINT user_contacts_client_id_fkey FOREIGN KEY (client_id) REFERENCES user_attributes (client_id);

--ALTER TABLE user_payment_log ADD CONSTRAINT user_payment_log_payment_amount_check CHECK (payment_amount >= 0);