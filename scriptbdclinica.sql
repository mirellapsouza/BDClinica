/*drop database bdclinica;*/

create database bdclinica;

use bdclinica;

create table paciente (
	pac_mat int primary key auto_increment,
	pac_nome varchar(40) not null,
	pac_mes_aniv int check (pac_mes_aniv between 01 and 12),
	pac_genero varchar(1) check (pac_genero in ('M', 'F')));

create table especialidade (
	esp_cod int primary key auto_increment,
	esp_nome varchar(40) not null);

create table medico (
	med_crm int primary key,
	med_nome varchar(40) not null);

create table laboratorio (
	lab_cod int primary key auto_increment,
	lab_nome varchar(40) not null);

create table consulta (
	con_num int primary key auto_increment,
	con_data date not null,
	con_hora varchar(5) not null,
	con_num_sala int not null,
	con_situac varchar(01) check (con_situac in ('A','R','C')),
	pac_mat int not null,
	med_crm int not null,
	foreign key (pac_mat) references paciente(pac_mat),
	foreign key (med_crm) references  medico(med_crm));

create table medicamento (
	mdc_cod int primary key auto_increment,
	mdc_nome varchar(40) not null,
	lab_cod int not null,
	foreign key (lab_cod) references laboratorio(lab_cod));

create table sintoma (
	sin_cod int primary key auto_increment,
	sin_nome varchar(40) not null);

create table efeito_colateral (
	mdc_cod int,
	sin_cod int,
	primary key (mdc_cod, sin_cod),
	foreign key (mdc_cod) references medicamento (mdc_cod),
	foreign key (sin_cod) references sintoma(sin_cod));	

create table receita (
	con_num int,
	mdc_cod int,
	rec_quant int check(rec_quant > 0),
	primary key (con_num, mdc_cod),
	foreign key (con_num) references consulta (con_num),
	foreign key (mdc_cod) references medicamento(mdc_cod) );

create table contra_indicacao(
	pac_mat int,
	mdc_cod int,
	primary key (pac_mat, mdc_cod),
	foreign key (pac_mat) references paciente(pac_mat),
	foreign key (mdc_cod) references medicamento(mdc_cod) );

create table formacao (
	med_crm int,
	esp_cod int,
	primary key (med_crm, esp_cod),
	foreign key (med_crm) references medico (med_crm),
	foreign key (esp_cod) references especialidade(esp_cod));	


insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('João Luís', 01, 'M');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Ricardo Almeida', 04, 'M');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Luís Arantes', 07, 'M');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Rafael da Silva', 12, 'M');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Rafael Nogueira', 02, 'M');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Priscila Dantas', 11, 'F');
insert into paciente (pac_nome, pac_mes_aniv, pac_genero)
values ('Larissa Durval', 02, 'F');

insert into especialidade (esp_nome)
values ('Otorrinolaringologia');
insert into especialidade (esp_nome)
values ('Pediatria');
insert into especialidade (esp_nome)
values ('Neurologia');
insert into especialidade (esp_nome)
values ('Ortopedia');
insert into especialidade (esp_nome)
values ('Cardiologia');
insert into especialidade (esp_nome)
values ('Dermatologia');
insert into especialidade (esp_nome)
values ('Psiquiatria');
insert into especialidade (esp_nome)
values ('Hematologia');
insert into especialidade (esp_nome)
values ('Obstetrícia');
insert into especialidade (esp_nome)
values ('Pneumologia');

insert into medico (med_crm, med_nome)
values (203, 'Luisa Garcia');
insert into medico (med_crm, med_nome)
values (411, 'Gustavo Souza');
insert into medico (med_crm, med_nome)
values (536, 'Thais Rodrigues');
insert into medico (med_crm, med_nome)
values (702, 'Paula Lacerda');
insert into medico (med_crm, med_nome)
values (987, 'Bruno Santos');

insert into laboratorio (lab_nome)
values ('EMS Corp');
insert into laboratorio (lab_nome)
values ('Hypera Pharma');
insert into laboratorio (lab_nome)
values ('Aché');
insert into laboratorio (lab_nome)
values ('Bayer');
insert into laboratorio (lab_nome)
values ('Eurofarma');
insert into laboratorio (lab_nome)
values ('Roche');

insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-08-18', '13:30', 10, 'R', 1, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-08-20', '14:30', 18, 'R', 5, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-08-25', '15:30', 23, 'A', 2, 987);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-08-19', '16:30', 18, 'R', 2, 203);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-09-22', '14:30', 23, 'C', 3, 702);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-09-25', '13:30', 23, 'A', 2, 987);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-01', '10:30', 11, 'A', 6, 702);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-09', '08:30', 10, 'A', 1, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-13', '09:30', 10, 'R', 4, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-15', '14:30', 11, 'R', 5, 203);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-09-22', '10:30', 11, 'C', 3, 203);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-12', '08:30', 21, 'C', 3, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-16', '08:30', 10, 'R', 1, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-22', '09:30', 22, 'R', 05, 987);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-12', '10:30', 22, 'R', 2, 987);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-10-18', '09:30', 10, 'R', 4, 411);
insert into consulta (con_data, con_hora, con_num_sala, con_situac, pac_mat, med_crm)
values ('2024-09-22', '11:30', 11, 'R', 6, 203);

insert into medicamento (mdc_nome, lab_cod)
values ('Nimesulida', 1);
insert into medicamento (mdc_nome, lab_cod)
values ('Prednisolona', 5);
insert into medicamento (mdc_nome, lab_cod)
values ('Dipirona', 6);
insert into medicamento (mdc_nome, lab_cod)
values ('Paracetamol', 3);
insert into medicamento (mdc_nome, lab_cod)
values ('Amoxil', 3);
insert into medicamento (mdc_nome, lab_cod)
values ('AAS', 3);

insert into sintoma (sin_nome)
values ('Azia');
insert into sintoma (sin_nome)
values ('Cefaleia');
insert into sintoma (sin_nome)
values ('Urticária');
insert into sintoma (sin_nome)
values ('Febre');
insert into sintoma (sin_nome)
values ('Hipotensão');
insert into sintoma (sin_nome)
values ('Sono');
insert into sintoma (sin_nome)
values ('Gastrite');
insert into sintoma (sin_nome)
values ('Hipertensão');
insert into sintoma (sin_nome)
values ('Tremor');
insert into sintoma (sin_nome)
values ('Enjoo');

insert into efeito_colateral (mdc_cod,sin_cod)
values (1, 1);
insert into efeito_colateral (mdc_cod,sin_cod)
values (1, 6);
insert into efeito_colateral (mdc_cod,sin_cod)
values (1, 4);
insert into efeito_colateral (mdc_cod,sin_cod)
values (2, 1);
insert into efeito_colateral (mdc_cod,sin_cod)
values (2, 5);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 2);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 4);
insert into efeito_colateral (mdc_cod,sin_cod)
values (1, 2);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 7);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 10);
insert into efeito_colateral (mdc_cod,sin_cod)
values (5, 8);
insert into efeito_colateral (mdc_cod,sin_cod)
values (6, 4);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 1);
insert into efeito_colateral (mdc_cod,sin_cod)
values (6, 10);
insert into efeito_colateral (mdc_cod,sin_cod)
values (3, 8);



insert into receita (con_num, mdc_cod, rec_quant)
values (1, 1, 1);
insert into receita (con_num, mdc_cod, rec_quant)
values (2, 1, 3);
insert into receita (con_num, mdc_cod, rec_quant)
values (2, 2, 2);
insert into receita (con_num, mdc_cod, rec_quant)
values (2, 6, 1);
insert into receita (con_num, mdc_cod, rec_quant)
values (5, 4, 3);
insert into receita (con_num, mdc_cod, rec_quant)
values (7, 1, 1);
insert into receita (con_num, mdc_cod, rec_quant)
values (7, 2, 4);
insert into receita (con_num, mdc_cod, rec_quant)
values (8, 2, 3);
insert into receita (con_num, mdc_cod, rec_quant)
values (8, 4, 2);
insert into receita (con_num, mdc_cod, rec_quant)
values (9, 1, 1);
insert into receita (con_num, mdc_cod, rec_quant)
values (9, 3, 2);
insert into receita (con_num, mdc_cod, rec_quant)
values (13, 3, 2);
insert into receita (con_num, mdc_cod, rec_quant)
values (14, 2, 2);

insert into contra_indicacao (pac_mat, mdc_cod)
values (1, 3);
insert into contra_indicacao (pac_mat, mdc_cod)
values (1, 1);
insert into contra_indicacao (pac_mat, mdc_cod)
values (3, 2);
insert into contra_indicacao (pac_mat, mdc_cod)
values (1, 4);
insert into contra_indicacao (pac_mat, mdc_cod)
values (2, 5);

insert into formacao (med_crm, esp_cod)
values (203, 2);
insert into formacao (med_crm, esp_cod)
values (203, 5);
insert into formacao (med_crm, esp_cod)
values (411, 1);
insert into formacao (med_crm, esp_cod)
values (411, 5);
insert into formacao (med_crm, esp_cod)
values (536, 3);
insert into formacao (med_crm, esp_cod)
values (702, 7);
insert into formacao (med_crm, esp_cod)
values (987, 8);
insert into formacao (med_crm, esp_cod)
values (987, 4);
insert into formacao (med_crm, esp_cod)
values (536, 9);
insert into formacao (med_crm, esp_cod)
values (702, 10);

/* 1- Nome dos pacientes de gênero M */
select pac_nome
from paciente
where pac_genero = "M";

/* 2- Nome dos pacientes e dos médicos das consultas do dia 19/08/2024 */
select pac_nome, med_nome
from paciente p, medico m, consulta c
where p.pac_mat = c.pac_mat
and m.med_crm = c.med_crm
and con_data = 19-08-2024;

/* 3– Nomes dos médicos de especialidade CARDIOLOGIA */
select med_nome
from medico m, especialidade e, formacao f
where m.med_crm = f.med_crm
and e.esp_cod = f.esp_cod
and esp_nome = "Cardiologia";

/* 4– Nome dos pacientes que receberam receita do medicamento PARACETAMOL e quantidade receitada */
select pac_nome, rec_quant
from paciente p, receita r, consulta c, medicamento m
where p.pac_mat = c.pac_mat
and r.con_num = r.con_num
and r.mdc_cod = m.mdc_cod
and m.mdc_cod = "Paracetamol";

/* 5– Nome de cada medicamento acompanhado do nome do seu laboratório */
select mdc_nome, lab_nome
from medicamento m, laboratorio l
where m.lab_cod = l.lab_cod;

/* 6– Nome dos medicamentos que causam FEBRE e HIPERTENSÃO */
select mdc_nome
from medicamento m, sintoma s, efeito_colateral e
where m.mdc_cod = e.mdc_cod
and s.sin_cod = e.sin_cod
and sin_nome in ("Febre", "Hipertensão");

/* 7– Nome dos médicos de especialidade PEDIATRIA que tiveram consulta em 22/09/2024 */
select med_nome
from medico m, especialidade e, consulta c, formacao f
where m.med_crm = c.med_crm
and f.med_crm = c.med_crm
and f.esp_cod = e.esp_cod
and con_data = "2024-09-22"
and esp_nome = "Pediatria";

/* 8– Nome dos pacientes que fazem aniversário no mês de NOVEMBRO */
select pac_nome
from paciente
where pac_mes_aniv = 11;

/* 9– Nome dos médicos que não atenderam em 25/09/2024  */
select med_nome
from medico
where med_crm not in (select distinct med_crm
						from consulta
                        where con_data = "2024-09-25");

/* 10– Nome dos pacientes que tiveram consulta nos meses de SETEMBRO e OUTUBRO de 2024 */
select distinct pac_nome
from paciente p, consulta c
where p.pac_mat = c.pac_mat
and con_data between "2024-09-01" and "2024-10-31";

/* 11 – Nome dos medicamentos que todos os pacientes podem tomar */
select mdc_nome
from medicamento
where mdc_cod not in (select mdc_cod
						from contra_indicacao);

/* 12– Nome dos médicos que não são pneumologistas */
select distinct med_nome
from medico m, especialidade e, formacao f
where m.med_crm = f.med_crm
and f.esp_cod = e.esp_cod
and esp_nome not in (select esp_nome
						from especialidade
						where esp_nome = "Pneumologia");
                        

/* 13- Nome dos médicos com suas respectivas especialidades */
select med_nome, esp_nome
from medico m, especialidade e, formacao f
where m.med_crm = f.med_crm
and f.esp_cod = e.esp_cod;

/* 14 – Nome dos laboratórios que tiveram medicamentos seus receitados em 01/10/2024 */
select lab_nome
from laboratorio l, medicamento m, receita r, consulta c
where r.mdc_cod = m.mdc_cod
and r.con_num = c.con_num
and m.lab_cod = l.lab_cod
and con_data = "2024-10-01";

/* 15 – Nome dos obstetras que não atenderam em 19/10/2024 */
select med_nome
from medico
where med_crm not in (select med_crm
						from consulta
                        where con_data = "2024-10-19");


/* 16 – Nome dos pacientes que cancelaram consultas no mês de SETEMBRO de 2024 */
select distinct pac_nome
from paciente p, consulta c
where p.pac_mat = c.pac_mat
and con_data between "2024-09-01" and "2024-09-30"
and con_situac = "C";

/* 17 – Nome dos medicamentos que causam HIPERTENSÃO */ 
select mdc_nome
from medicamento m, sintoma s, efeito_colateral e
where e.sin_cod = s.sin_cod
and e.mdc_cod = m.mdc_cod
and sin_nome = "Hipertensão";

/* 18 – Nome dos medicamentos que causam FEBRE ou HIPERTENSÃO */ 
select distinct mdc_nome
from medicamento m, efeito_colateral e, sintoma s
where e.mdc_cod = m.mdc_cod
and e.sin_cod = s.sin_cod
and sin_nome in ("Febre", "Hipertensão");

/* 19 – Nome dos medicamentos que causam HIPERTENSÃO e foram receitados em AGOSTO de 2024 */ 
select distinct mdc_nome
from medicamento m, sintoma s, efeito_colateral e, consulta c, receita r
where e.sin_cod = s.sin_cod
and e.mdc_cod = m.mdc_cod
and c.con_num = r.con_num
and sin_nome = "Hipertensão"
and con_data between "2024-08-01" and "2024-08-31";

/* 20 – Nome dos medicamentos que causam HIPERTENSÃO mas não causam FEBRE */
select mdc_nome, sin_nome
from medicamento m, sintoma s, efeito_colateral e
where e.sin_cod = s.sin_cod
and e.mdc_cod = m.mdc_cod
and sin_nome = "Hipertensão"
and m.mdc_cod not in (select mdc_cod
					from efeito_colateral e, sintoma s
                    where s.sin_cod = e.sin_cod
                    and sin_nome = "Febre");
                     
/* 21 – Nome dos pacientes que não podem tomar AMOXIL */
select pac_nome
from paciente p, contra_indicacao c, medicamento m
where p.pac_mat = c.pac_mat
and c.mdc_cod = m.mdc_cod
and m.mdc_nome = "Amoxil";

/* 22 – Nome dos pacientes do sexo M que consultaram em AGOSTO de 2024 com médico ortopedista */

 
/*

 

23 – Nome dos médicos que receitaram algum medicamento que causa SONO. 

 

24 – Nome dos medicamentos que podem causar FEBRE, acompanhados do nome de seus respectivos laboratórios. 

 

25 – Nome das especialidades que não possuem nenhum médico habilitado. 

 

26 – Nome dos médicos que atenderam na sala 18 em 20/08/2024. 

 

27 – Nome dos médicos que atenderam na sala 18, mas não em 20/08/2024. 

 

28 – Número das consultas que não geraram receita, acompanhado dos nomes do paciente e do médico. 

 

29 – Nome dos laboratórios que não tiveram nenhum medicamento receitado no mês de AGOSTO de 2024. 

 

30 – Nome dos medicamentos que não causam nenhum efeito colateral. 


*/

 
/*

  */





