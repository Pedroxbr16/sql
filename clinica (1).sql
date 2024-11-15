-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/11/2024 às 20:40
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `unidade_medida` varchar(50) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `deposito` varchar(100) DEFAULT NULL,
  `estoque_minimo` int(11) DEFAULT NULL,
  `estoque_seguranca` int(11) DEFAULT NULL,
  `tipo_material` varchar(50) DEFAULT NULL,
  `segmento` varchar(255) NOT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id`, `descricao`, `unidade_medida`, `quantidade`, `deposito`, `estoque_minimo`, `estoque_seguranca`, `tipo_material`, `segmento`, `preco`) VALUES
(5, 'Parafuso 6mm', 'Unidade', 200, 'Depósito A', 50, 100, 'Ferragem', 'Construção', 0.10),
(6, 'Cimento CP II', 'Saco', 67, 'Depósito B', 20, 30, 'Material de Construção', 'Construção', 25.00),
(7, 'Cabo de Rede CAT6', 'Metro', 997, 'Depósito C', 100, 200, 'Eletrônico', 'Infraestrutura', 3.50),
(8, 'Papel A4 75g', 'Pacote', 288, 'Depósito D', 20, 50, 'Material de Escritório', 'Papelaria', 15.00),
(9, 'Tinta Látex Branca', 'Galão', 0, 'Depósito A', 5, 10, 'Tintas', 'Pintura', 50.00),
(10, 'Tubo PVC 100mm', 'Metro', 148, 'Depósito B', 10, 30, 'Material Hidráulico', 'Hidráulica', 12.00),
(11, 'Lâmpada LED 9W', 'Unidade', 74, 'Depósito C', 10, 20, 'Iluminação', 'Elétrica', 10.00),
(12, 'Areia Média', 'Metro Cúbico', 30, 'Depósito D', 5, 10, 'Material de Construção', 'Construção', 60.00),
(13, 'Válvula Esfera 1/2', 'Unidade', 199, 'Depósito A', 20, 40, 'Hidráulico', 'Hidráulica', 8.50),
(14, 'Broca de Concreto 8mm', 'Unidade', 150, 'Depósito B', 15, 25, 'Ferramenta', 'Ferragem', 5.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `hora_venda` time NOT NULL,
  `total_venda` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `notas`
--

INSERT INTO `notas` (`id`, `usuario_id`, `data_venda`, `hora_venda`, `total_venda`) VALUES
(26, 8, '2024-11-15', '16:20:23', 410.00),
(27, 8, '2024-11-15', '16:20:34', 45.50),
(28, 8, '2024-11-15', '16:20:42', 50.00),
(29, 10, '2024-11-15', '16:21:09', 422.00),
(30, 10, '2024-11-15', '16:25:30', 850.00),
(31, 11, '2024-11-15', '16:26:31', 360.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `nota_itens`
--

CREATE TABLE `nota_itens` (
  `id` int(11) NOT NULL,
  `nota_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `nota_itens`
--

INSERT INTO `nota_itens` (`id`, `nota_id`, `produto_id`, `quantidade`, `preco_unitario`, `subtotal`) VALUES
(77, 26, 5, 100, 0.10, 10.00),
(78, 26, 6, 10, 25.00, 250.00),
(79, 26, 8, 10, 15.00, 150.00),
(80, 27, 8, 1, 15.00, 15.00),
(81, 27, 10, 1, 12.00, 12.00),
(82, 27, 11, 1, 10.00, 10.00),
(83, 27, 13, 1, 8.50, 8.50),
(84, 28, 11, 5, 10.00, 50.00),
(85, 29, 6, 10, 25.00, 250.00),
(86, 29, 5, 70, 0.10, 7.00),
(87, 29, 8, 1, 15.00, 15.00),
(88, 29, 9, 3, 50.00, 150.00),
(89, 30, 9, 17, 50.00, 850.00),
(90, 31, 6, 13, 25.00, 325.00),
(91, 31, 5, 130, 0.10, 13.00),
(92, 31, 10, 1, 12.00, 12.00),
(93, 31, 7, 3, 3.50, 10.50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `funcao` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `sobrenome`, `funcao`, `email`, `password`) VALUES
(8, 'eduardo', 'alves', 'Venda', 'eduardovenda@gmail.com', '$2y$10$N6oFjIqJ68X0K3sR8WAp0elPM9y73isnCXFmeWIrbONWtzlAvOgRW'),
(9, 'eduardo', 'alves', 'Estoque', 'eduardoestoque@gmail.com', '$2y$10$ZFCj8JR8bcly55Qn7..PeOhXtXJGgBTAeLx14xKII9L/bozNK237a'),
(10, 'Nicole', 'Oliveira Santos', 'Venda', 'nickvenda@gmail.com', '$2y$10$Z3j9so5RUISRCnhcXnKywuu59QCac4XB9srivXcW0laJeVZ82exy6'),
(11, 'Nicole', 'Oliveira Santos', 'Venda', 'nickvenda1@gmail.com', '$2y$10$tcjsvHNIUcaTdfPmsn54NeDkcioZ98ocXjzJChFOpSV9VGf7B2WGO');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendedor_id` (`usuario_id`);

--
-- Índices de tabela `nota_itens`
--
ALTER TABLE `nota_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nota_id` (`nota_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de tabela `nota_itens`
--
ALTER TABLE `nota_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `nota_itens`
--
ALTER TABLE `nota_itens`
  ADD CONSTRAINT `nota_itens_ibfk_1` FOREIGN KEY (`nota_id`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `nota_itens_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `estoque` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
