-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/11/2024 às 14:06
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendente`
--

CREATE TABLE `atendente` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `funcao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendente`
--

INSERT INTO `atendente` (`id`, `usuario`, `senha`, `email`, `funcao`) VALUES
(7, 'pedro', '$2a$10$.XpQtYhP3UQPsVdeG7gWb.8aK/5BS2vwow/jZjAGsw.thJH6xFv0S', 'pedro@pedro.com', NULL),
(8, 'usuario', '$2a$10$llK8cicNpI4SJ6gjpJ3aJuHEvyd0GMk67kQ0bXdbOA8PLT2iIsPpC', 'atendente@atendente.com', 'adm'),
(9, 'carlos', '$2a$10$msnrtNjuiKaGGXQOA23h6.0Go29CEKKl7NVLcR3wj0ZhgpHdO4zoC', 'carlos@calrlos.com', 'atendente'),
(11, 'admin', 'admin123', 'admin@clinica.com', 'adm'),
(13, 'medico', 'medico123', 'medico@clinica.com', 'medico'),
(14, 'atendente', 'atendente123', 'atendente@clinica.com', 'atendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `tipo_consulta_id` int(11) NOT NULL,
  `modalidade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `titulo`, `inicio`, `fim`, `paciente_id`, `medico_id`, `tipo_consulta_id`, `modalidade`) VALUES
(8, 'teste', '2024-11-24 00:15:00', '2024-11-24 01:15:00', 2, 1, 1, 'Presencial'),
(9, 'teste2', '2024-11-23 22:15:00', '2024-11-23 23:15:00', 3, 3, 3, 'Online'),
(10, 'asda', '2024-11-25 12:35:00', '2024-11-25 12:35:00', 15, 4, 3, 'Presencial'),
(11, 'ewfgw', '2024-12-20 11:00:00', '2024-12-20 12:00:00', 16, 1, 2, 'Presencial'),
(12, 'qr23', '2024-11-25 12:50:00', '2024-11-25 12:50:00', 17, 1, 1, 'Presencial');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exames`
--

CREATE TABLE `exames` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `exames`
--

INSERT INTO `exames` (`id`, `nome`) VALUES
(2, 'Hemograma Completo'),
(3, 'Raio-X'),
(4, 'Tomografia Computadorizada'),
(5, 'Ressonância Magnética'),
(7, 'Endoscopia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `data_consulta` date NOT NULL,
  `historico` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`id`, `paciente_id`, `data_consulta`, `historico`) VALUES
(1, 2, '2024-11-16', 'teste'),
(2, 2, '2024-11-16', 'paciente tem dores no joelho\n'),
(3, 2, '2024-11-16', 'nada demais'),
(4, 2, '2024-11-19', 'amdasbfbaswukibqscnaslcafasdfwe'),
(5, 3, '2024-11-19', 'nmhiasbchabscksjqsdfq'),
(6, 2, '2024-11-19', 'Lorem ipsum quisque viverra lacus amet lorem accumsan lacus nam primis, posuere iaculis curae a per mi aliquam quis libero, class erat primis conubia erat ligula praesent phasellus ante. eu cursus hac fringilla quisque posuere phasellus sollicitudin posuere aliquam molestie pulvinar eget tristique praesent, ornare facilisis ligula fusce ad integer ultrices ullamcorper habitasse nibh in bibendum. eu nam pretium volutpat nec auctor amet ac, inceptos dictum nulla consequat elementum lorem tincidunt cubilia, vehicula turpis odio purus quisque lobortis. augue rutrum ut sociosqu sem taciti consequat purus congue condimentum blandit lacus, donec rutrum ante sed at vitae etiam euismod etiam.'),
(8, 3, '2024-11-21', 'restrd');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `crm` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medicos`
--

INSERT INTO `medicos` (`id`, `usuario`, `crm`, `data_nascimento`, `email`, `celular`, `cpf`, `cep`, `numero`, `bairro`, `cidade`, `estado`) VALUES
(1, 'pjusto', ' 123456/RJ', '2024-11-03', 'teste@exemplo.us', '(11) 11111-1111', '706.641.590-60', '26130-150', '136', 'Centro', 'Belford Roxo', 'RJ'),
(3, 'edu', '487123/RJ', '2024-11-16', 'medico@gmail.com', '(22) 22222-2222', '537.240.200-82', '26130-150', '124', 'Centro', 'Belford Roxo', 'RJ'),
(4, 'João Souza Silva', '423443/RJ', NULL, 'teste@exemplo.us', '(23) 45312-3421', '122.222.222-22', '30260-080', '2000', 'Santa Efigênia', 'Belo Horizonte', 'MG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  `nascimento` date NOT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `foto` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `nome`, `cep`, `numero`, `bairro`, `cidade`, `estado`, `cpf`, `cnpj`, `nascimento`, `genero`, `email`, `telefone`, `celular`, `foto`) VALUES
(2, 'Pedro Henrique Pestana Justo', '26130150', '136', 'Centro', 'Belford Roxo', 'RJ', '99999999999', '24124214125555', '4213-03-12', 'Masculino', 'teste@exemplo.us', '3445234523', '23453123421', 0x313733313538393636303238372d50656469646f5f4578616d65735f4a6fc383c2a36f2053696c7661202831292e706466),
(3, 'pedro', '26130150', '136', 'Centro', 'Belford Roxo', 'RJ', '18385640711', '', '2024-10-30', 'Masculino', 'herique.ph50@gmail.com', '3445234523', '11111111111', 0x313733323139373032373634362d54656cc383c2a36f206e6f766f2e706e67),
(4, 'asda', '26130150', '22', 'Centro', 'Belford Roxo', 'RJ', '22222222222', '22222222222222', '5123-12-13', 'Feminino', 'a@a', '2131234123', '12342151253', 0x313733323139373137303633362d646f776e6c6f61642e6a706567),
(5, 'adfasgqqwe', '25075015', '123124', 'Jardim Vinte e Cinco de Agosto', 'Duque de Caxias', 'RJ', '12341241231', '12341234125313', '0000-00-00', 'Masculino', 'bomdia@bomdia', '2131234123', '12342151253', NULL),
(6, 'asda', '26130150', '22', 'Centro', 'Belford Roxo', 'RJ', '12312312344', NULL, '1231-03-12', 'Outro', 'lcaduduflamenguista@gmail.com', NULL, '1231243144', NULL),
(7, '12qqe', '26130150', '234', 'Centro', 'Belford Roxo', 'RJ', '32453424645', NULL, '0000-00-00', 'Masculino', 'a@AAAA', NULL, '12342151253', NULL),
(8, 'teste', '26130150', '1231', 'Centro', 'Belford Roxo', 'RJ', '12344124123', NULL, '0034-12-11', 'Masculino', 'pa@asd', '1234123451', '12314123512', 0x313733323135303933383133392d496d6167656d20646f20576861747341707020646520323032342d31312d323020c383c2a02873292032302e33372e31355f61336262623864622e6a7067),
(9, 'Pedro Pestana', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '12323132455', NULL, '2015-01-25', 'Masculino', 'pedropestana@gmail.com', '21971656061', '12312412314', NULL),
(10, 'Pedro', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '12312413124', NULL, '2000-01-12', 'Masculino', 'pedropestana@gmail.com', '21971656061', '12312412413', NULL),
(11, 'Pedro pestana', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '12324213512', NULL, '2000-02-12', 'Masculino', 'pedropestana@gmail.com', '21971656061', '12314124512', NULL),
(12, 'Pedro pestana', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '12323412433', NULL, '2000-02-12', 'Masculino', 'pedropestana@gmail.com', '21971656061', '14322412412', NULL),
(13, 'adfasfdasfd', '26130150', '123134', 'Centro', 'Belford Roxo', 'RJ', '21424531332', NULL, '4412-03-12', 'Masculino', 'teste@exemplo.us234', '2134123521', '21342134213', NULL),
(14, 'Pedro pestana', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '12343212434', NULL, '2020-02-12', 'Masculino', 'b@b', '21971656061', '13412524113', NULL),
(15, 'Pedro', '26130150', '122', 'Centro', 'Belford Roxo', 'RJ', '32413415114', NULL, '2020-02-12', 'Masculino', 'b@b', '21971656061', '13412524113', NULL),
(16, 'Pedro h', '25075015', '12', 'Jardim Vinte e Cinco de Agosto', 'Duque de Caxias', 'RJ', '12314151412', NULL, '2900-02-23', 'Masculino', 'b@b', '21971656061', '1232431235', NULL),
(17, 'Pedro J', '26130150', '12', 'Centro', 'Belford Roxo', 'RJ', '12314215412', NULL, '1234-03-12', 'Masculino', 'a@a', '21971656061', '12312412511', NULL),
(18, 'Pedro JJ', '25075015', '122', 'Jardim Vinte e Cinco de Agosto', 'Duque de Caxias', 'RJ', '34151342321', NULL, '4533-03-12', 'Masculino', 'a@a', '21971656061', '12341234125', NULL),
(19, 'Pedro JJJ', '25075015', '2', 'Jardim Vinte e Cinco de Agosto', 'Duque de Caxias', 'RJ', '14315213412', NULL, '1234-03-12', 'Masculino', 'a@a', '21971656061', '12342153321', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pre_agendamento`
--

CREATE TABLE `pre_agendamento` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `medico_id` int(11) NOT NULL,
  `modalidade` enum('Presencial','Online') NOT NULL,
  `data_desejada` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pre_agendamento`
--

INSERT INTO `pre_agendamento` (`id`, `user_id`, `email`, `telefone`, `medico_id`, `modalidade`, `data_desejada`, `status`) VALUES
(1, 1, '', '21971656061', 1, 'Presencial', '2024-12-20 11:00:00', 'Concluído');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_consulta`
--

CREATE TABLE `tipos_consulta` (
  `id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_consulta`
--

INSERT INTO `tipos_consulta` (`id`, `descricao`) VALUES
(1, 'exemplo3'),
(2, 'exemplo'),
(3, 'aaaaaaaaaa'),
(4, 'a'),
(5, 'aaaaaa'),
(6, '1234415'),
(7, '123421564688');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Pedro', 'pedro@gmail.com', '123456'),
(2, 'edu', 'edu@gmail.com', '123456'),
(3, 'Claudia', 'claudia@gmail.com', '123456');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendente`
--
ALTER TABLE `atendente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_paciente` (`paciente_id`),
  ADD KEY `fk_medico` (`medico_id`),
  ADD KEY `fk_tipo_consulta` (`tipo_consulta_id`);

--
-- Índices de tabela `exames`
--
ALTER TABLE `exames`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Índices de tabela `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pre_agendamento`
--
ALTER TABLE `pre_agendamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Índices de tabela `tipos_consulta`
--
ALTER TABLE `tipos_consulta`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendente`
--
ALTER TABLE `atendente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `exames`
--
ALTER TABLE `exames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `pre_agendamento`
--
ALTER TABLE `pre_agendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tipos_consulta`
--
ALTER TABLE `tipos_consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `fk_medico` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`),
  ADD CONSTRAINT `fk_paciente` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `fk_tipo_consulta` FOREIGN KEY (`tipo_consulta_id`) REFERENCES `tipos_consulta` (`id`);

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`);

--
-- Restrições para tabelas `pre_agendamento`
--
ALTER TABLE `pre_agendamento`
  ADD CONSTRAINT `pre_agendamento_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pre_agendamento_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
