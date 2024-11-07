-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/11/2024 às 03:11
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
(1, 'teste', '$2a$10$WYRdzOpUcZkvWesjBpRfhuJuqLr3IYG5UC7p4EKVYa0bGZz5JRMXq', 'algo@algo.com', NULL),
(7, 'pedro', '$2a$10$.XpQtYhP3UQPsVdeG7gWb.8aK/5BS2vwow/jZjAGsw.thJH6xFv0S', 'pedro@pedro.com', NULL),
(8, 'usuario', '$2a$10$E75b/qOI352PVbZDkEWkVua0vgNCfRQEFn9K.7p9ErbjrsceZTUhO', 'atendente@atendente.com', NULL),
(9, 'carlos', '$2a$10$msnrtNjuiKaGGXQOA23h6.0Go29CEKKl7NVLcR3wj0ZhgpHdO4zoC', 'carlos@calrlos.com', 'atendente');

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
(2, 'Pedro Henrique Pestana Justo', '26130150', '136', 'Centro', 'Belford Roxo', 'RJ', '99999999999', '24124214125555', '4213-03-12', 'Masculino', 'teste@exemplo.us', '3445234523', '23453123421', NULL),
(3, 'pedro', '26130150', '136', 'Centro', 'Belford Roxo', 'RJ', '18385640711', NULL, '2024-10-30', 'Masculino', 'herique.ph50@gmail.com', '3445234523', '11111111111', NULL);

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
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendente`
--
ALTER TABLE `atendente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
