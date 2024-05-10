CREATE TABLE estado (
  cod_estado SERIAL PRIMARY KEY,
  estado VARCHAR(45) NOT NULL
);

CREATE TABLE estado_civil (
  cod_estado_civil SERIAL PRIMARY KEY,
  estado_civil VARCHAR(45) NOT NULL
);

CREATE TABLE escolaridade (
  cod_escolaridade SERIAL PRIMARY KEY,
  escolaridade VARCHAR(45) NOT NULL
);

CREATE TABLE hobbie (
  cod_hobbie SERIAL PRIMARY KEY,
  hobbie VARCHAR(45) NOT NULL
);


CREATE TABLE motivo_licenca (
  cod_motivo_licenca SERIAL PRIMARY KEY,
  motivo_licenca VARCHAR(45) NOT NULL
);

CREATE TABLE especialidade (
  cod_especialidade SERIAL PRIMARY KEY,
  especialidade VARCHAR(45) NOT NULL
);

CREATE TABLE colaborador (
  cod_colaborador SERIAL PRIMARY KEY,
  nome_colaborador VARCHAR(45) NOT NULL,
  data_nascimento DATE NOT NULL,
  sexo_colaborador VARCHAR(45) NOT NULL,
  gtd_filhos INT NOT NULL,
  possui_pet VARCHAR(3) NOT NULL,
  cod_estado_civil INT NOT NULL,
  FOREIGN KEY (cod_estado_civil) REFERENCES estado(cod_estado)
);

CREATE TABLE medico (
  cod_medico SERIAL PRIMARY KEY,
  nome_medico VARCHAR(45) NOT NULL,
  cod_especialidade INT NOT NULL,
  FOREIGN KEY (cod_especialidade) REFERENCES especialidade(cod_especialidade)
);

CREATE TABLE processamento_licenca (
  cod_processamento SERIAL PRIMARY KEY,
  data_processamento DATE NOT NULL,
  cod_colaborador INT NOT NULL,
  cod_medico INT NOT NULL,
  cod_motivo_licenca INT NOT NULL,
  data_inicio_licenca DATE NOT NULL,
  data_fim_licenca DATE NOT NULL,
  duracao_licenca INT NOT NULL,
  FOREIGN KEY (cod_colaborador) REFERENCES colaborador(cod_colaborador),
  FOREIGN KEY (cod_medico) REFERENCES medico(cod_medico),
  FOREIGN KEY (cod_motivo_licenca) REFERENCES motivo_licenca(cod_motivo_licenca)
);
