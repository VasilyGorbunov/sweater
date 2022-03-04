DELETE FROM user_role;
DELETE FROM usr;

INSERT INTO usr(id, active, password, username) VALUES
(1, true, '$2a$08$fQKIU9rgV2Z43Zj5Df6Xne3f7ZP7gGBuol3eyCU7zzBspZF9nrNFe', 'dru'),
(2, true, '$2a$08$fQKIU9rgV2Z43Zj5Df6Xne3f7ZP7gGBuol3eyCU7zzBspZF9nrNFe', 'mike');

INSERT INTO user_role(user_id, roles) VALUES
(1, 'USER'), (1, 'ADMIN'), (2, 'USER');
