insert into component (id, model, producer, price)
       values (1, '11900K', 'Intel', 1509.00);
insert into processor (core, max_freq, min_freq, socket, core_number, crystal_name, thermal_power, id)
       values ('Core i9', 5.3, 3.5, 'LGA1200', 8, 'Rocket Lake', 125, 1);

insert into component (id, model, producer, price)
       values (2, '3600', 'AMD', 569.31);
insert into processor (core, max_freq, min_freq, socket, core_number, crystal_name, thermal_power, id)
       values ('Ryzen 5', 4.2, 3.6, 'AM4', 6, 'Matisse', 65, 2);

insert into component (id, model, producer, price)
       values (3, '11400', 'Intel', 555.00);
insert into processor (core, max_freq, min_freq, socket, core_number, crystal_name, thermal_power, id)
       values ('Core i5', 4.4, 2.6, 'LGA1200', 6, 'Rocket Lake', 65, 3);

insert into component (id, model, producer, price)
       values (4, '3700X', 'AMD', 742.19);
insert into processor (core, max_freq, min_freq, socket, core_number, crystal_name, thermal_power, id)
       values ('Ryzen 7', 4.4, 3.6, 'AM4', 8, 'Matisse', 65, 4);

insert into component (id, model, producer, price)
       values (5, '10700K', 'Intel', 923.47);
insert into processor (core, max_freq, min_freq, socket, core_number, crystal_name, thermal_power, id)
       values ('Core i7', 5.1, 3.8, 'LGA1200', 8, 'Comet Lake', 125, 5);

insert into component (id, model, producer, price)
       values (6, 'DUAL', 'Palit', 2399.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, gpu_interface, height, length, recommented_power, id)
       values ('GeForce RTX 3060', 'NVIDIA', 12, 'GDDR6', 'PCI Express 4.0 x16', 119, 245, 550, 6);

insert into component (id, model, producer, price)
       values (7, 'D6 WINDFORCE OC', 'Gigabyte', 1030.19);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, gpu_interface, height, length, recommented_power, id)
       values ('GeForce GTX 1650', 'NVIDIA', 4, 'GDDR6', 'PCI Express 3.0 x16', 112, 191, 300, 7);


insert into component (id, model, producer, price)
       values (8, 'V2 OC Edition', 'ASUS ROG Strix', 2899.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, gpu_interface, height, length, recommented_power, id)
       values ('GeForce RTX 3060 Ti', 'NVIDIA', 8, 'GDDR6', 'PCI Express 4.0 x16', 140, 318, 750, 8);


insert into component (id, model, producer, price)
       values (9, 'Ventus XS OC', 'MSI', 2050.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, gpu_interface, height, length, recommented_power, id)
       values ('GeForce GTX 1660 Super', 'NVIDIA', 6, 'GDDR6', 'PCI Express 3.0 x16', 128, 204, 450, 9);


insert into component (id, model, producer, price)
       values (10, 'TUF Gaming OC Edition', 'ASUS', 5990.00);
insert into graphics_card (gpu_model, gpu_producer, video_memory, video_memory_type, gpu_interface, height, length, recommented_power, id)
       values ('GeForce RTX 3080 Ti', 'NVIDIA', 12, 'GDDR6X', 'PCI Express 4.0 x16', 126, 299, 850, 10);


insert into component (id, model, producer, price)
       values (11, 'B450M S2H', 'Gigabyte', 166.02);
insert into mother_board (pci_version, chipset, form_factor, length, m_two, memory_slots, memory_type, socket, width, id)
       values ('3.0 and 2.0','AMD B450', 'mAtx', 244, 1, 2, 'DDR4', 'AM4', 205, 11);


insert into component (id, model, producer, price)
       values (12, 'B560M-HDV', 'ASRock', 205.07);
insert into mother_board (pci_version, chipset, form_factor, length, m_two, memory_slots, memory_type, socket, width, id)
       values ('4.0 and 3.0','Intel B560', 'mAtx', 244, 2, 2, 'DDR4', 'LGA1200', 198, 12);


insert into component (id, model, producer, price)
       values (13, 'TUF B450M-Pro Gaming', 'ASUS', 237.39);
insert into mother_board (pci_version, chipset, form_factor, length, m_two, memory_slots, memory_type, socket, width, id)
       values ('3.0 and 2.0','AMD B450', 'mAtx', 244, 2, 4, 'DDR4', 'AM4',244 , 13);


insert into component (id, model, producer, price)
       values (14, 'MAG B550 Tomahawk', 'MSI', 467.00);
insert into mother_board (pci_version, chipset, form_factor, length, m_two, memory_slots, memory_type, socket, width, id)
       values ('4.0 and 3.0','AMD B550', 'ATX', 244, 2, 4, 'DDR4', 'AM4', 305, 14);


insert into component (id, model, producer, price)
       values (15, 'Z690 Gaming X', 'Gigabyte', 763.15);
insert into mother_board (pci_version, chipset, form_factor, length, m_two, memory_slots, memory_type, socket, width, id)
       values ('5.0','Intel Z690', 'ATX', 244, 4, 4, 'DDR4', 'LGA1700', 305, 15);


insert into component (id, model, producer, price)
       values (16, 'Pure Base 500 BG035', 'be quiet!', 195.03);
insert into computer_case (case_type, colour, material, section_number, compatible_motherboards, depth, height, max_graphics_card_width, max_power_unit_width, weight, width, id)
       values ('Mid Tower', 'white/??????????', 'metal/??????????', 6,'ATX, micro-ATX, mini-ITX', 450, 463, 369, 258, 6.95, 463,  16);


insert into component (id, model, producer, price)
       values (17, 'MATREXX 55 V3', 'DeepCool', 186.03);
insert into computer_case (case_type, colour, material, section_number, compatible_motherboards, depth, height, max_graphics_card_width, max_power_unit_width, weight, width, id)
       values ('Mid Tower', 'white/??????????', 'metal/??????????', 6,'ATX, micro-ATX, eATX, mini-ITX', 446, 479, 370, 170, 7.4, 479, 17);


insert into component (id, model, producer, price)
       values (18, 'Silent Base 802 Window', 'be quiet!', 474.60);
insert into computer_case (case_type, colour, material, section_number, compatible_motherboards, depth, height, max_graphics_card_width, max_power_unit_width, weight, width, id)
       values ('Mid Tower', 'black/????????????', 'steel/??????????', 6,'ATX, micro-ATX, mini-ITX', 539, 553, 432, 288, 13.15, 553, 18);


insert into component (id, model, producer, price)
       values (19, 'N5 MF', 'Zalman', 100.20);
insert into computer_case (case_type, colour, material, section_number, compatible_motherboards, depth, height, max_graphics_card_width, max_power_unit_width, weight, width, id)
       values ('Mid Tower', 'black/????????????', 'plastic/??????????????', 5,'ATX, micro-ATX, mini-ITX', 437, 450, 365, 160, 3.6, 450, 19);


insert into component (id, model, producer, price)
       values (20, 'FireBase X2', '1stPlayer', 94.99);
insert into computer_case (case_type, colour, material, section_number, compatible_motherboards, depth, height, max_graphics_card_width, max_power_unit_width, weight, width, id)
       values ('Mid Tower', 'black/????????????', 'steel/??????????', 7,'ATX, micro-ATX, mini-ITX', 326, 398, 310, 170, 3.8, 398, 20);


insert into component (id, model, producer, price)
       values (21, 'P2', 'Crucial', 245.84);
insert into ssd (capacity, controller, form_factor, reading_speed, ssd_interface, writing_speed, recording_resource, microchip_type, id)
       values (1000, 'Phison PS5013-E13T', 'M.2', 2400, 'PCI Express 3.0 x4 (NVMe)', 1800, 300, '3D QLC', 21);


insert into component (id, model, producer, price)
       values (22, '870 Evo', 'Samsung', 224.85);
insert into ssd (capacity, controller, form_factor, reading_speed, ssd_interface, writing_speed, recording_resource, microchip_type, id)
       values (500, 'Samsung MKX', '2.5"', 560, 'SATA 3.0', 530, 600, '3D TLC', 22);


insert into component (id, model, producer, price)
       values (23, 'NV1', 'Kingston', 141.80);
insert into ssd (capacity, controller, form_factor, reading_speed, ssd_interface, writing_speed, recording_resource, microchip_type, id)
       values (500, '-', 'M.2', 2000, 'PCI Express 3.0 x4', 1700, 480, '3D TLC', 23);


insert into component (id, model, producer, price)
       values (24, 'Radeon R5', 'AMD', 142.04);
insert into ssd (capacity, controller, form_factor, reading_speed, ssd_interface, writing_speed, recording_resource, microchip_type, id)
       values (512, 'Silicon Motion SM2258XT', '2.5"', 540, 'SATA 3.0', 460, 150, '3D TLC', 24);


insert into component (id, model, producer, price)
       values (25, '870 QVO', 'Samsung', 275.00);
insert into ssd (capacity, controller, form_factor, reading_speed, ssd_interface, writing_speed, recording_resource, microchip_type, id)
       values (1000, 'Samsung MKX', '2.5"', 560, 'SATA 3.0', 530, 360, 'MLC', 25);

insert into component (id, model, producer, price)
       values (26, 'L200', 'Toshiba', 107.63);
insert into hdd (buffer_size, capacity, form_factor, rotation_speed, hdd_interface, thickness, id)
       values (128, 1000, '2.5"', 5400, 'SATA 3.0 (6Gbps)', 7, 26);


insert into component (id, model, producer, price)
       values (27, 'Red Plus', 'WD', 560.00);

insert into component (id, model, producer, price)
       values (28, 'Purple', 'WD', 302.41);
insert into hdd (buffer_size, capacity, form_factor, rotation_speed, hdd_interface, thickness, id)
       values (64, 4000, '3.5"', 5400, 'SATA 3.0 (6Gbps)', 26, 28);


insert into component (id, model, producer, price)
       values (29, 'IronWolf', 'Seagate', 445.00);
insert into hdd (buffer_size, capacity, form_factor, rotation_speed, hdd_interface, thickness, id)
       values (256, 8000, '3.5"', 7200, 'SATA 3.0 (6Gbps)', 20, 29);


insert into component (id, model, producer, price)
       values (30, 'Exos X16', 'Seagate', 967.12);
insert into hdd (buffer_size, capacity, form_factor, rotation_speed, hdd_interface, thickness, id)
       values (256, 16000, '3.5"', 7200, 'SATA 3.0 (6Gbps)', 26, 30);


insert into component (id, model, producer, price)
       values (31, 'FURY Beast', 'Kingston', 218.40);
insert into ram (capacity, freq, type, module_set, id)
       values (16, 3200.0, 'DDR4 DIMM', 2, 31);


insert into component (id, model, producer, price)
       values (32, 'Ballistix', 'Crucial', 238.0);
insert into ram (capacity, freq, type, module_set, id)
       values (16, 3200.0, 'DDR4 DIMM', 1, 32);

insert into component (id, model, producer, price)
       values (33, 'Fury', 'HyperX', 280.58);
insert into ram (capacity, freq, type, module_set, id)
       values (16, 3200.0, 'DDR4 DIMM', 1, 33);


insert into component (id, model, producer, price)
       values (34, 'Viper', 'Patriot', 201.73);
insert into ram (capacity, freq, type, module_set, id)
       values (16, 1600.0, 'DDR3 DIMM', 2, 34);


insert into component (id, model, producer, price)
       values (35, 'Aegis', 'G.Skill', 110.66);
insert into ram (capacity, freq, type, module_set, id)
       values (8, 3200.0, 'DDR4 DIMM', 2, 35);


insert into component (id, model, producer, price)
       values (36, 'Proton', 'Chieftec', 201.00);
insert into power_unit (certificate, power, depth, efficiency, height, pfc, standard, width, id)
       values ('bronze', 850.0, 160, 85, 87, 'active', 'ATX12V 2.3', 150, 36);


insert into component (id, model, producer, price)
       values (37, 'GigaMax', 'Zalman', 166.23);
insert into power_unit (certificate, power, depth, efficiency, height, pfc, standard, width, id)
       values ('bronze', 750.0, 140, 88, 86, 'active', 'ATX12V 2.31', 86, 37);


insert into component (id, model, producer, price)
       values (38, 'ECO', 'AeroCool', 60.00);
insert into power_unit (certificate, power, depth, efficiency, height, pfc, standard, width, id)
       values ('-', 500.0, 140, 88, 86, 'active', 'ATX12V 2.31', 150, 38);


insert into component (id, model, producer, price)
       values (39, 'System Power', 'be quiet!', 150.27);
insert into power_unit (certificate, power, depth, efficiency, height, pfc, standard, width, id)
       values ('bronze', 600.0, 140, 88, 86, 'active', 'ATX12V 2.31', 86, 39);


insert into component (id, model, producer, price)
       values (40, 'MVE', 'Cooler Master', 139.80);
insert into power_unit (certificate, power, depth, efficiency, height, pfc, standard, width, id)
       values ('basic', 600.0, 140, 85, 86, 'active', 'ATX12V 2.52', 150, 40);

