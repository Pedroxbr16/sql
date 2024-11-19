-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/11/2024 às 01:52
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
(1, 'teste', '$2a$10$3rueofIVUz7Ae0AC6Ert4.Darv51npAvfNepWlW9NqTbsu2pbBLvC', 'algo@algo.com', 'atendente'),
(7, 'pedro', '$2a$10$.XpQtYhP3UQPsVdeG7gWb.8aK/5BS2vwow/jZjAGsw.thJH6xFv0S', 'pedro@pedro.com', NULL),
(8, 'usuario', '$2a$10$llK8cicNpI4SJ6gjpJ3aJuHEvyd0GMk67kQ0bXdbOA8PLT2iIsPpC', 'atendente@atendente.com', 'adm'),
(9, 'carlos', '$2a$10$msnrtNjuiKaGGXQOA23h6.0Go29CEKKl7NVLcR3wj0ZhgpHdO4zoC', 'carlos@calrlos.com', 'atendente');

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

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `titulo`, `inicio`, `fim`, `paciente_id`, `medico_id`, `tipo_consulta_id`) VALUES
(1, 'teste', '2024-11-12 00:32:00', '2024-11-12 02:35:00', 3, 1, 1),
(4, 'asdas', '2024-11-15 22:41:00', '2024-11-15 23:41:00', 3, 3, 2);

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
(5, 'Ressonância Magnética');

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
(7, 2, '2024-11-19', '	Lorem ipsum quisque viverra lacus amet lorem accumsan lacus nam primis, posuere iaculis curae a per mi aliquam quis libero, class erat primis conubia erat ligula praesent phasellus ante. eu cursus hac fringilla quisque posuere phasellus sollicitudin posuere aliquam molestie pulvinar eget tristique praesent, ornare facilisis ligula fusce ad integer ultrices ullamcorper habitasse nibh in bibendum. eu nam pretium volutpat nec auctor amet ac, inceptos dictum nulla consequat elementum lorem tincidunt cubilia, vehicula turpis odio purus quisque lobortis. augue rutrum ut sociosqu sem taciti consequat purus congue condimentum blandit lacus, donec rutrum ante sed at vitae etiam euismod etiam. \n\n	In euismod mauris dapibus sed elementum tempus scelerisque interdum consequat, sodales dapibus metus hendrerit tortor risus aenean vitae, integer duis vulputate condimentum sodales amet varius risus. interdum in id curae suspendisse senectus dui dictumst convallis, dui potenti ligula quam mi aptent quisque mi lacus, pellentesque lectus vivamus justo ornare iaculis donec. primis litora vulputate mi donec auctor sagittis hendrerit justo nam conubia aenean tempus, sed aenean suspendisse sociosqu id platea nulla per nam eros scelerisque. cubilia praesent felis venenatis malesuada metus justo luctus diam, class ad semper lorem commodo litora cras vulputate iaculis, eget mattis praesent ut luctus curae integer. \n\n	Ullamcorper eleifend dolor senectus ante vivamus sociosqu egestas rutrum sapien, vel nunc ullamcorper porttitor eleifend rutrum consequat cras, augue maecenas primis curabitur eu eget dui viverra. senectus justo ultricies himenaeos vehicula commodo pulvinar tellus fusce, interdum donec faucibus potenti nam dapibus fames, arcu pellentesque libero taciti id dui sodales. varius lobortis purus fringilla tempor aenean cubilia vulputate senectus, pulvinar proin urna habitant fringilla eros eleifend, volutpat molestie lacus ultricies est elementum vel. curabitur primis purus nunc nisl eu interdum vivamus augue duis sagittis fusce, rutrum torquent convallis donec aliquet dictum morbi torquent felis non phasellus mollis, fames feugiat posuere fringilla aenean semper mollis nostra sociosqu interdum. \n\n	Risus commodo non dapibus ultricies porttitor quam hendrerit habitant rhoncus cursus, fermentum pharetra congue massa gravida sollicitudin in auctor. turpis taciti varius eros eu lacinia inceptos, varius auctor eu vulputate neque habitasse odio, volutpat consequat risus auctor libero. dolor metus quam dolor lacus odio eget erat fames volutpat, gravida litora malesuada consequat fames vulputate ut orci condimentum, ut litora cursus integer venenatis vestibulum eros sodales. taciti sagittis venenatis a nam adipiscing, lacus eget cursus porta sit lacus, habitasse purus mi phasellus. sodales eros accumsan amet tempus consectetur lorem imperdiet, sed gravida porttitor ultrices neque massa ante, quisque turpis taciti scelerisque potenti volutpat. \n\n	Imperdiet donec cursus euismod sociosqu convallis ante, non hendrerit enim lectus aliquam mauris, auctor ut lacinia quisque mauris. rutrum orci nec massa nunc phasellus sollicitudin bibendum tellus id aptent, eget curabitur hac sociosqu nec placerat nec felis sapien. primis diam sagittis ornare imperdiet id imperdiet pharetra nullam fames cursus ipsum id porta, erat laoreet class fames viverra senectus etiam sed etiam vivamus suscipit. massa ultricies et morbi sagittis dapibus libero feugiat nisi laoreet, nec elit feugiat enim nullam euismod torquent. egestas vehicula commodo aliquam non, tincidunt imperdiet hac amet velit, accumsan nostra malesuada. ');

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
(7, '12qqe', '26130150', '234', 'Centro', 'Belford Roxo', 'RJ', '32453424645', NULL, '0000-00-00', 'Masculino', 'a@AAAA', NULL, '12342151253', NULL);

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
(1, 'exemplo2'),
(2, 'exemplo'),
(3, 'aaaaaaaaaa'),
(4, 'a'),
(5, 'aaaaaa'),
(6, '1234415'),
(7, '123421564688'),
(8, '1235467wgfvdsjng');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `exames`
--
ALTER TABLE `exames`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
