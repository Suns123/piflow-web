ALTER TABLE `flow_info` DROP FOREIGN KEY FKdjb71fwj4i1m5cvijp2ayykkh;
alter table `flow_path` drop foreign key FK33rp96r4290eonsirbwrp8h0f;
alter table `flow_process_path` drop foreign key FKad4n0sl8j977awtec5beyrphy;
alter table `flow_process_stop` drop foreign key FK6rvjgxm3smnh3jjjnxnqiwl1p;
alter table `flow_process_stop_property` drop foreign key FK6pqbouerl5dg97la1yqygj5rp;
alter table `flow_stops` drop foreign key FK11mku3yphyjswbtwj9df79k44;
alter table `flow_stops_property` drop foreign key FKsjcg9klyumklhkpl8408v6uuq;
alter table `flow_stops_property_template` drop foreign key FKhtnjkpgjkx21r2qf4r3q3mjr9;
alter table `flow_template` drop foreign key FKkcg573sjiknyhppuc0q62a0kj;
alter table `association_groups_stops_template` drop foreign key FK5ceurc1karlogl9ppecmkcp7e;
alter table `association_groups_stops_template` drop foreign key FKqwv1iytgkhhgnjdvhqbskncf4;
alter table `mx_graph_model` drop foreign key FKktpy5kv5fgya1gn012g7395l9;
alter table `mx_cell` drop foreign key FK4s2gnt8t7e5ok1v7r3v99pji5;
alter table `mx_geometry` drop foreign key FK6elkg2vbxxjrun0qaqaajwgfu;
alter table `stops_template` drop foreign key FKn0wu7i6frf0xp2iypda50vlmh;
alter table `property_template` drop foreign key FK35p1h6w0dsmjc33eavnbuiys3;
alter table `sys_role` drop foreign key FK48hlg5qgnejc4xropo99whsyt;

alter table `flow` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_info` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_path` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_process` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_process_path` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_process_stop` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_process_stop_property` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_stops_groups` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_stops` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_stops_property` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_stops_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_stops_property_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `flow_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `hibernate_sequence` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `association_groups_stops_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `mx_graph_model` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `mx_cell` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `mx_geometry` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `stops_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `property_template` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `sys_user` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;
alter table `sys_role` convert to CHARACTER SET  utf8 COLLATE utf8_general_ci;


ALTER TABLE `flow_info` ADD CONSTRAINT `FKdjb71fwj4i1m5cvijp2ayykkh` FOREIGN KEY (`fk_flow_id`) REFERENCES `flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_path` ADD CONSTRAINT `FK33rp96r4290eonsirbwrp8h0f` FOREIGN KEY (`fk_flow_id`) REFERENCES `flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_process_path` ADD CONSTRAINT `FKad4n0sl8j977awtec5beyrphy` FOREIGN KEY (`fk_flow_process_id`) REFERENCES `flow_process` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_process_stop` ADD CONSTRAINT `FK6rvjgxm3smnh3jjjnxnqiwl1p` FOREIGN KEY (`fk_flow_process_id`) REFERENCES `flow_process` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_process_stop_property` ADD CONSTRAINT `FK6pqbouerl5dg97la1yqygj5rp` FOREIGN KEY (`fk_flow_process_stop_id`) REFERENCES `flow_process_stop` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_stops` ADD CONSTRAINT `FK11mku3yphyjswbtwj9df79k44` FOREIGN KEY (`fk_flow_id`) REFERENCES `flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_stops_property` ADD CONSTRAINT `FKsjcg9klyumklhkpl8408v6uuq` FOREIGN KEY (`fk_stops_id`) REFERENCES `flow_stops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_stops_property_template` ADD CONSTRAINT `FKhtnjkpgjkx21r2qf4r3q3mjr9` FOREIGN KEY (`fk_stops_id`) REFERENCES `flow_stops_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flow_template` ADD CONSTRAINT `FKkcg573sjiknyhppuc0q62a0kj` FOREIGN KEY (`fk_flow_id`) REFERENCES `flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `association_groups_stops_template` ADD CONSTRAINT `FK5ceurc1karlogl9ppecmkcp7e` FOREIGN KEY (`groups_id`) REFERENCES `flow_stops_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `association_groups_stops_template` ADD CONSTRAINT `FKqwv1iytgkhhgnjdvhqbskncf4` FOREIGN KEY (`stops_template_id`) REFERENCES `flow_stops_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `mx_graph_model` ADD CONSTRAINT `FKktpy5kv5fgya1gn012g7395l9` FOREIGN KEY (`fk_flow_id`) REFERENCES `flow` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `mx_cell` ADD CONSTRAINT `FK4s2gnt8t7e5ok1v7r3v99pji5` FOREIGN KEY (`fk_mx_graph_id`) REFERENCES `mx_graph_model` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `mx_geometry` ADD CONSTRAINT `FK6elkg2vbxxjrun0qaqaajwgfu` FOREIGN KEY (`fk_mx_cell_id`) REFERENCES `mx_cell` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `stops_template` ADD CONSTRAINT `FKn0wu7i6frf0xp2iypda50vlmh` FOREIGN KEY (`fk_template_id`) REFERENCES `flow_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `property_template` ADD CONSTRAINT `FK35p1h6w0dsmjc33eavnbuiys3` FOREIGN KEY (`fk_stops_id`) REFERENCES `stops_template` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sys_role` ADD CONSTRAINT `FK48hlg5qgnejc4xropo99whsyt` FOREIGN KEY (`fk_sys_user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;