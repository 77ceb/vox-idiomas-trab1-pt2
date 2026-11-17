-- Banco de dados: Vox Idiomas
-- Exportado para a avaliação A2 (PHP + MySQL)
-- Importar no phpMyAdmin ou via: mysql -u root < vox_idiomas.sql

CREATE DATABASE IF NOT EXISTS vox_idiomas
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE vox_idiomas;

-- ============================================================
-- Seção CONTATO (INSERT via formulário)
-- ============================================================
DROP TABLE IF EXISTS contatos;
CREATE TABLE contatos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(120) NOT NULL,
  email VARCHAR(150) NOT NULL,
  mensagem TEXT NOT NULL,
  data_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- Seção SERVIÇOS (LISTAGEM no site)
-- ============================================================
DROP TABLE IF EXISTS servicos;
CREATE TABLE servicos (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(150) NOT NULL,
  descricao TEXT NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  unidade_preco VARCHAR(80) NOT NULL,
  imagem VARCHAR(255) NOT NULL,
  alt_imagem VARCHAR(255) NOT NULL,
  link_orcamento VARCHAR(255) DEFAULT NULL,
  ordem INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO servicos (titulo, descricao, preco, unidade_preco, imagem, alt_imagem, link_orcamento, ordem) VALUES
(
  'Idiomas para Viagens e Turismo',
  'Vocabulário e expressões essenciais para aeroportos, hotéis, restaurantes, compras e imigração — fale com independência em qualquer destino.',
  480.00,
  '/ curso de 4 semanas',
  'images/servicos/viagens-mundo.png',
  'Ilustração de globo com bandeiras representando idiomas para viagens',
  '#contato',
  1
),
(
  'Business English (Idiomas Corporativos)',
  'Termos técnicos de negócios, apresentações, reuniões internacionais e e-mails corporativos — para atuar em multinacionais com propriedade.',
  950.00,
  '/ pacote de 8 semanas',
  'images/servicos/corporativo.png',
  'Logo Business English, curso de inglês corporativo',
  '#contato',
  2
),
(
  'Aulas Online e EaD ao Vivo',
  'Todo o método presencial transportado para videoconferências em tempo real, com flexibilidade total de horário.',
  320.00,
  '/ mês',
  'images/servicos/online-logo.png',
  'Logo EAD Idiomas, aulas online ao vivo',
  '#contato',
  3
);

-- ============================================================
-- Seção BLOG (LISTAGEM no site)
-- ============================================================
DROP TABLE IF EXISTS blog_posts;
CREATE TABLE blog_posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(200) NOT NULL,
  resumo TEXT NOT NULL,
  autor VARCHAR(120) NOT NULL,
  cargo_autor VARCHAR(120) DEFAULT NULL,
  data_publicacao DATETIME NOT NULL,
  imagem VARCHAR(255) NOT NULL,
  alt_imagem VARCHAR(255) NOT NULL,
  fonte VARCHAR(150) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO blog_posts (titulo, resumo, autor, cargo_autor, data_publicacao, imagem, alt_imagem, fonte) VALUES
(
  'Como perder o medo de falar inglês e destravar a conversação',
  'O maior obstáculo para a fluência não é a falta de gramática, mas sim o medo de errar. A regra de ouro é mudar o foco da perfeição para a comunicação: fale sozinho em casa, assista séries no idioma original e não peça desculpas por errar — a segurança vem com a prática constante.',
  'Letícia Dornelles',
  'Coordenadora Pedagógica',
  '2026-09-01 14:30:00',
  'images/blog/post1.png',
  'Ilustração: falar inglês com confiança',
  'British Council Brasil'
),
(
  'O impacto do bilinguismo na carreira profissional e salários',
  'Dominar um segundo idioma deixou de ser diferencial e passou a ser requisito básico no mercado global. Profissionais fluentes em inglês ou espanhol podem ter incremento salarial expressivo, além de acesso a projetos multinacionais e vagas remotas em moedas mais fortes.',
  'Ricardo Mendes',
  'Líder de Treinamento Corporativo',
  '2026-08-28 09:15:00',
  'images/blog/post2-c.webp',
  'Ilustração: hello em vários idiomas ao redor de um globo',
  'portal de carreiras Catho'
);
