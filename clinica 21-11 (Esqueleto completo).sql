-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/11/2024 às 14:26
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
  `tipo_consulta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(3, 'pedro', '26130150', '136', 'Centro', 'Belford Roxo', 'RJ', '18385640711', NULL, '2024-10-30', 'Masculino', 'herique.ph50@gmail.com', '3445234523', '11111111111', NULL),
(4, 'asda', '26130150', '22', 'Centro', 'Belford Roxo', 'RJ', '22222222222', '22222222222222', '5123-12-13', 'Feminino', 'a@a', '2131234123', '12342151253', NULL),
(5, 'adfasgqqwe', '25075015', '123124', 'Jardim Vinte e Cinco de Agosto', 'Duque de Caxias', 'RJ', '12341241231', '12341234125313', '0000-00-00', 'Masculino', 'bomdia@bomdia', '2131234123', '12342151253', NULL),
(6, 'asda', '26130150', '22', 'Centro', 'Belford Roxo', 'RJ', '12312312344', NULL, '1231-03-12', 'Outro', 'lcaduduflamenguista@gmail.com', NULL, '1231243144', NULL),
(7, '12qqe', '26130150', '234', 'Centro', 'Belford Roxo', 'RJ', '32453424645', NULL, '0000-00-00', 'Masculino', 'a@AAAA', NULL, '12342151253', NULL),
(8, 'teste', '26130150', '1231', 'Centro', 'Belford Roxo', 'RJ', '12344124123', NULL, '0034-12-11', 'Masculino', 'pa@asd', '1234123451', '12314123512', 0x313733323135303933383133392d496d6167656d20646f20576861747341707020646520323032342d31312d323020c383c2a02873292032302e33372e31355f61336262623864622e6a7067);

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
-- Índices de tabela `tipos_consulta`
--
ALTER TABLE `tipos_consulta`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `tipos_consulta`
--
ALTER TABLE `tipos_consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
