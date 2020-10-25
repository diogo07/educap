import 'package:educap/models/university.dart';
import 'package:flutter/material.dart';

class Constants {
  static String API_URL = 'http://157.230.48.95/api/';
  static String USER_TOKEN = null;
  static University university = null;
  static int yearAnalyze = null;
  static List<dynamic> listGrupoCursos = [
    {"codigo": 0, "nome": "TODOS"},
    {"codigo": 5, "nome": "MEDICINA VETERINÁRIA"},
    {"codigo": 6, "nome": "ODONTOLOGIA"},
    {"codigo": 12, "nome": "MEDICINA"},
    {"codigo": 17, "nome": "AGRONOMIA"},
    {"codigo": 19, "nome": "FARMÁCIA"},
    {"codigo": 23, "nome": "ENFERMAGEM"},
    {"codigo": 27, "nome": "FONOAUDIOLOGIA"},
    {"codigo": 28, "nome": "NUTRIÇÃO"},
    {"codigo": 36, "nome": "FISIOTERAPIA"},
    {"codigo": 38, "nome": "SERVIÇO SOCIAL"},
    {"codigo": 51, "nome": "ZOOTECNIA"},
    {"codigo": 55, "nome": "BIOMEDICINA"},
    {"codigo": 69, "nome": "TECNOLOGIA EM RADIOLOGIA"},
    {"codigo": 90, "nome": "TECNOLOGIA EM AGRONEGÓCIOS"},
    {"codigo": 91, "nome": "TECNOLOGIA EM GESTÃO HOSPITALAR"},
    {"codigo": 92, "nome": "TECNOLOGIA EM GESTÃO AMBIENTAL"},
    {"codigo": 95, "nome": "TECNOLOGIA EM ESTÉTICA E COSMÉTICA"},
    {"codigo": 3501, "nome": "EDUCAÇÃO FÍSICA (BACHARELADO)"},
    {"codigo": 1, "nome": "ADMINISTRAÇÃO"},
    {"codigo": 2, "nome": "DIREITO"},
    {"codigo": 13, "nome": "CIÊNCIAS ECONÔMICAS"},
    {"codigo": 18, "nome": "PSICOLOGIA"},
    {"codigo": 22, "nome": "CIÊNCIAS CONTÁBEIS"},
    {"codigo": 26, "nome": "DESIGN"},
    {"codigo": 29, "nome": "TURISMO"},
    {"codigo": 67, "nome": "SECRETARIADO EXECUTIVO"},
    {"codigo": 81, "nome": "RELAÇÕES INTERNACIONAIS"},
    {"codigo": 83, "nome": "TECNOLOGIA EM DESIGN DE MODA"},
    {"codigo": 84, "nome": "TECNOLOGIA EM MARKETING"},
    {"codigo": 85, "nome": "TECNOLOGIA EM PROCESSOS GERENCIAIS"},
    {"codigo": 86, "nome": "TECNOLOGIA EM GESTÃO DE RECURSOS HUMANOS"},
    {"codigo": 87, "nome": "TECNOLOGIA EM GESTÃO FINANCEIRA"},
    {"codigo": 88, "nome": "TECNOLOGIA EM GASTRONOMIA"},
    {"codigo": 93, "nome": "TECNOLOGIA EM GESTÃO COMERCIAL"},
    {"codigo": 94, "nome": "TECNOLOGIA EM LOGÍSTICA"},
    {"codigo": 100, "nome": "ADMINISTRAÇÃO PÚBLICA"},
    {"codigo": 101, "nome": "TEOLOGIA"},
    {"codigo": 102, "nome": "TECNOLOGIA EM COMÉRCIO EXTERIOR"},
    {"codigo": 103, "nome": "TECNOLOGIA EM DESIGN DE INTERIORES"},
    {"codigo": 104, "nome": "TECNOLOGIA EM DESIGN GRÁFICO"},
    {"codigo": 105, "nome": "TECNOLOGIA EM GESTÃO DA QUALIDADE"},
    {"codigo": 106, "nome": "TECNOLOGIA EM GESTÃO PÚBLICA"},
    {"codigo": 803, "nome": "JORNALISMO"},
    {"codigo": 804, "nome": "PUBLICIDADE E PROPAGANDA"},
    {"codigo": 21, "nome": "ARQUITETURA E URBANISMO"},
    {
      "codigo": 72,
      "nome": "TECNOLOGIA EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS"
    },
    {"codigo": 73, "nome": "TECNOLOGIA EM AUTOMAÇÃO INDUSTRIAL"},
    {"codigo": 76, "nome": "TECNOLOGIA EM GESTÃO DA PRODUÇÃO INDUSTRIAL"},
    {"codigo": 79, "nome": "TECNOLOGIA EM REDES DE COMPUTADORES"},
    {"codigo": 701, "nome": "MATEMÁTICA (BACHARELADO)"},
    {"codigo": 702, "nome": "MATEMÁTICA (LICENCIATURA)"},
    {"codigo": 903, "nome": "LETRAS-PORTUGUÊS (BACHARELADO)"},
    {"codigo": 904, "nome": "LETRAS-PORTUGUÊS (LICENCIATURA)"},
    {"codigo": 905, "nome": "LETRAS-PORTUGUÊS E INGLÊS (LICENCIATURA)"},
    {"codigo": 906, "nome": "LETRAS-PORTUGUÊS E ESPANHOL (LICENCIATURA)"},
    {"codigo": 1401, "nome": "FÍSICA (BACHARELADO)"},
    {"codigo": 1402, "nome": "FÍSICA (LICENCIATURA)"},
    {"codigo": 1501, "nome": "QUÍMICA (BACHARELADO)"},
    {"codigo": 1502, "nome": "QUÍMICA (LICENCIATURA)"},
    {"codigo": 1601, "nome": "CIÊNCIAS BIOLÓGICAS (BACHARELADO)"},
    {"codigo": 1602, "nome": "CIÊNCIAS BIOLÓGICAS (LICENCIATURA)"},
    {"codigo": 2001, "nome": "PEDAGOGIA (LICENCIATURA)"},
    {"codigo": 2401, "nome": "HISTÓRIA (BACHARELADO)"},
    {"codigo": 2402, "nome": "HISTÓRIA (LICENCIATURA)"},
    {"codigo": 2501, "nome": "ARTES VISUAIS (LICENCIATURA)"},
    {"codigo": 3001, "nome": "GEOGRAFIA (BACHARELADO)"},
    {"codigo": 3002, "nome": "GEOGRAFIA (LICENCIATURA)"},
    {"codigo": 3201, "nome": "FILOSOFIA (BACHARELADO)"},
    {"codigo": 3202, "nome": "FILOSOFIA (LICENCIATURA)"},
    {"codigo": 3502, "nome": "EDUCAÇÃO FÍSICA (LICENCIATURA)"},
    {"codigo": 4004, "nome": "CIÊNCIA DA COMPUTAÇÃO (BACHARELADO)"},
    {"codigo": 4005, "nome": "CIÊNCIA DA COMPUTAÇÃO (LICENCIATURA)"},
    {"codigo": 4006, "nome": "SISTEMAS DE INFORMAÇÃO"},
    {"codigo": 4301, "nome": "MÚSICA (LICENCIATURA)"},
    {"codigo": 5401, "nome": "CIÊNCIAS SOCIAIS (BACHARELADO)"},
    {"codigo": 5402, "nome": "CIÊNCIAS SOCIAIS (LICENCIATURA)"},
    {"codigo": 5710, "nome": "ENGENHARIA CIVIL"},
    {"codigo": 5806, "nome": "ENGENHARIA ELÉTRICA"},
    {"codigo": 5809, "nome": "ENGENHARIA DE COMPUTAÇÃO"},
    {"codigo": 5814, "nome": "ENGENHARIA DE CONTROLE E AUTOMAÇÃO"},
    {"codigo": 5902, "nome": "ENGENHARIA MECÂNICA"},
    {"codigo": 6008, "nome": "ENGENHARIA QUÍMICA"},
    {"codigo": 6009, "nome": "ENGENHARIA DE ALIMENTOS"},
    {"codigo": 6208, "nome": "ENGENHARIA DE PRODUÇÃO"},
    {"codigo": 6306, "nome": "ENGENHARIA"},
    {"codigo": 6307, "nome": "ENGENHARIA AMBIENTAL"},
    {"codigo": 6405, "nome": "ENGENHARIA FLORESTAL"},
    {"codigo": 4003, "nome": "ENGENHARIA DA COMPUTAÇÃO "},
    {"codigo": 6002, "nome": "ENGENHARIA DE ALIMENTOS "},
    {"codigo": 6407, "nome": "LETRAS - INGLÊS "},
    {"codigo": 6409, "nome": "TECNOLOGIA EM GESTÃO DA TECNOLOGIA DA INFORMAÇÃO"}
  ];

  static List<dynamic> questions = [
    {
      "codigo": "CO_RS_I1",
      "A": "Muito fácil.",
      "B": "Fácil.",
      "C": "Médio.",
      "D": "Difícil.",
      "E": "Muito difícil.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I2",
      "A": "Muito fácil.",
      "B": "Fácil.",
      "C": "Médio.",
      "D": "Difícil.",
      "E": "Muito difícil.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I3",
      "A": "Muito longa.",
      "B": "Longa.",
      "C": "Adequada.",
      "D": "Curta.",
      "E": "Muito curta.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I4",
      "A": "Sim, todos.",
      "B": "Sim, a maioria.",
      "C": "Apenas cerca da metade.",
      "D": "Poucos.",
      "E": "Não, nenhum.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I5",
      "A": "Sim, todos.",
      "B": "Sim, a maioria.",
      "C": "Apenas cerca da metade.",
      "D": "Poucos.",
      "E": "Não, nenhum.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I6",
      "A": "Sim, até excessivas.",
      "B": "Sim, em todas elas.",
      "C": "Sim, na maioria delas.",
      "D": "Sim, somente em algumas.",
      "E": "Não, em nenhuma delas.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I7",
      "A": "Desconhecimento do conteúdo.",
      "B": "Forma diferente de abordagem do conteúdo.",
      "C": "Espaço insuficiente para responder às questões.",
      "D": "Falta de motivação para fazer a prova.",
      "E": "Não tive qualquer tipo de dificuldade para responder à prova.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I8",
      "A": "Não estudou ainda a maioria desses conteúdos.",
      "B": "Estudou alguns desses conteúdos, mas não os aprendeu.",
      "C": "Estudou a maioria desses conteúdos, mas não os aprendeu.",
      "D": "Estudou e aprendeu muitos desses conteúdos.",
      "E": "Estudou e aprendeu todos esses conteúdos.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "CO_RS_I9",
      "A": "Menos de uma hora.",
      "B": "Entre uma e duas horas.",
      "C": "Entre duas e três horas.",
      "D": "Entre três e quatro horas.",
      "E": "Quatro horas e não consegui terminar.",
      ".": "Sem resposta",
      "*": "Resposta anulada",
    },
    {
      "codigo": "QE_I01",
      "A": "Solteiro(a).",
      "B": "Casado(a).",
      "C": "Separado(a) judicialmente/divorciado(a).",
      "D": "Viúvo(a).",
      "E": "Outro.",
    },
    {
      "codigo": "QE_I02",
      "A": "Branca.",
      "B": "Preta.",
      "C": "Amarela.",
      "D": "Parda.",
      "E": "Indígena.",
      "F": "Não quero declarar.",
    },
    {
      "codigo": "QE_I03",
      "A": "Brasileira.",
      "B": "Brasileira naturalizada.",
      "C": "Estrangeira.",
    },
    {
      "codigo": "QE_I04",
      "A": "Nenhuma.",
      "B": "Ensino Fundamental: 1º ao 5º ano (1ª a 4ª série).",
      "C": "Ensino Fundamental: 6º ao 9º ano (5ª a 8ª série).",
      "D": "Ensino Médio.",
      "E": "Ensino Superior - Graduação.",
      "F": "Pós-graduação.",
    },
    {
      "codigo": "QE_I05",
      "A": "Nenhuma.",
      "B": "Ensino Fundamental: 1º ao 5º ano (1ª a 4ª série).",
      "C": "Ensino Fundamental: 6º ao 9º ano (5ª a 8ª série).",
      "D": "Ensino médio.",
      "E": "Ensino Superior - Graduação.",
      "F": "Pós-graduação.",
    },
    {
      "codigo": "QE_I06",
      "A": "Em casa ou apartamento, sozinho.",
      "B": "Em casa ou apartamento, com pais e/ou parentes.",
      "C": "Em casa ou apartamento, com cônjuge e/ou filhos.",
      "D": "Em casa ou apartamento, com outras pessoas (incluindo república).",
      "E": "Em alojamento universitário da própria instituição.",
      "F":
          "Em outros tipos de habitação individual ou coletiva (hotel, hospedaria, pensão ou outro).",
    },
    {
      "codigo": "QE_I07",
      "A": "Nenhuma.",
      "B": "Uma.",
      "C": "Duas.",
      "D": "Três.",
      "E": "Quatro.",
      "F": "Cinco.",
      "G": "Seis.",
      "H": "Sete ou mais.",
    },
    {
      "codigo": "QE_I08",
      "A": "Até 1,5 salário mínimo (até R\$ 1.431,00).",
      "B": "De 1,5 a 3 salários mínimos (R\$ 1.431,01 a R\$ 2.862,00).",
      "C": "De 3 a 4,5 salários mínimos (R\$ 2.862,01 a R\$ 4.293,00).",
      "D": "De 4,5 a 6 salários mínimos (R\$ 4.293,01 a R\$ 5.724,00).",
      "E": "De 6 a 10 salários mínimos (R\$ 5.724,01 a R\$ 9.540,00).",
      "F": "De 10 a 30 salários mínimos (R\$ 9.540,01 a R\$ 28.620,00).",
      "G": "Acima de 30 salários mínimos (mais de R\$ 28.620,00).",
    },
    {
      "codigo": "QE_I09",
      "A":
          "Não tenho renda e meus gastos são financiados por programas governamentais.",
      "B":
          "Não tenho renda e meus gastos são financiados pela minha família ou por outras pessoas.",
      "C":
          "Tenho renda, mas recebo ajuda da família ou de outras pessoas para financiar meus gastos.",
      "D": "Tenho renda e não preciso de ajuda para financiar meus gastos.",
      "E": "Tenho renda e contribuo com o sustento da família.",
      "F": "Sou o principal responsável pelo sustento da família.",
    },
    {
      "codigo": "QE_I10",
      "A": "Não estou trabalhando.",
      "B": "Trabalho eventualmente.",
      "C": "Trabalho até 20 horas semanais.",
      "D": "Trabalho de 21 a 39 horas semanais.",
      "E": "Trabalho 40 horas semanais ou mais.",
    },
    {
      "codigo": "QE_I11",
      "A": "Nenhum, pois meu curso é gratuito.",
      "B": "Nenhum, embora meu curso não seja gratuito.",
      "C": "ProUni integral.",
      "D": "ProUni parcial, apenas.",
      "E": "FIES, apenas.",
      "F": "ProUni Parcial e FIES.",
      "G": "Bolsa oferecida por governo estadual, distrital ou municipal.",
      "H": "Bolsa oferecida pela própria instituição.",
      "I": "Bolsa oferecida por outra entidade (empresa, ONG, outra).",
      "J": "Financiamento oferecido pela própria instituição.",
      "K": "Financiamento bancário.",
    },
    {
      "codigo": "QE_I12",
      "A": "Nenhum.",
      "B": "Auxílio moradia.",
      "C": "Auxílio alimentação.",
      "D": "Auxílio moradia e alimentação.",
      "E": "Auxílio Permanência.",
      "F": "Outro tipo de auxílio.",
    },
    {
      "codigo": "QE_I13",
      "A": "Nenhum.",
      "B": "Bolsa de iniciação científica.",
      "C": "Bolsa de extensão.",
      "D": "Bolsa de monitoria/tutoria.",
      "E": "Bolsa PET.",
      "F": "Outro tipo de bolsa acadêmica.",
    },
    {
      "codigo": "QE_I14",
      "A": "Não participei.",
      "B": "Sim, Programa Ciência sem Fronteiras.",
      "C": "Sim, programa de intercâmbio financiado pelo Governo Federal.",
      "D": "Sim, programa de intercâmbio financiado pelo Governo Estadual.",
      "E": "Sim, programa de intercâmbio da minha instituição.",
      "F": "Sim, outro intercâmbio não institucional.",
    },
    {
      "codigo": "QE_I15",
      "A": "Não.",
      "B": "Sim, por critério étnico-racial.",
      "C": "Sim, por critério de renda.",
      "D":
          "Sim, por ter estudado em escola pública ou particular com bolsa de estudos.",
      "E": "Sim, por sistema que combina dois ou mais critérios anteriores.",
      "F": "Sim, por sistema diferente dos anteriores.",
    },
    {
      "codigo": "QE_I16",
      "11": "Rondônia (RO)",
      "12": "Acre (AC)",
      "13": "Amazonas (AM)",
      "14": "Roraima (RR)",
      "15": "Pará (PA)",
      "16": "Amapa (AP)",
      "17": "Tocantins (TO)",
      "21": "Maranhão (MA)",
      "22": "Piauí (PI)",
      "23": "Ceará (CE)",
      "24": "Rio Grande do Norte (RN)",
      "25": "Paraíba (PB)",
      "26": "Pernambuco (PE)",
      "27": "Alagoas (AL)",
      "28": "Sergipe (SE)",
      "29": "Bahia (BA)",
      "31": "Minas gerais (MG)",
      "32": "Espírito Santo (ES)",
      "33": "Rio de Janeiro (RJ)",
      "35": "São Paulo (SP)",
      "41": "Paraná (PR)",
      "42": "Santa Catarina (SC)",
      "43": "Rio Grande do Sul (RS)",
      "50": "Mato Grosso do Sul (MS)",
      "51": "Mato Grosso (MT)",
      "52": "Goiás (GO)",
      "53": "Distrito federal (DF)",
      "99": "Não se aplica",
    },
    {
      "codigo": "QE_I17",
      "A": "Todo em escola pública.",
      "B": "Todo em escola privada.",
      "C": "Todo no exterior.",
      "D": "A maior parte em escola pública.",
      "E": "A maior parte em escola privada.",
      "F": "Parte no Brasil e parte no exterior.",
    },
    {
      "codigo": "QE_I18",
      "A": "Ensino médio tradicional.",
      "B": "Profissionalizante técnico.",
      "C": "Profissionalizante magistério.",
      "D": "Educação de Jovens e Adultos",
      "E": "Outro modalidade.",
    },
    {
      "codigo": "QE_I19",
      "A": "Ninguém.",
      "B": "Pais.",
      "C": "Outros membros da família que não os pais.",
      "D": "Professores.",
      "E": "Líder ou representante religioso.",
      "F": "Colegas/Amigos.",
      "G": "Outras pessoas.",
    },
    {
      "codigo": "QE_I20",
      "A": "Não tive dificuldade.",
      "B": "Não recebi apoio para enfrentar dificuldades.",
      "C": "Pais.",
      "D": "Avós.",
      "E": "Irmãos, primos ou tios.",
      "F": "Líder ou representante religioso.",
      "G": "Colegas de curso ou amigos.",
      "H": "Professores do curso.",
      "I": "Profissionais do serviço de apoio ao estudante da IES.",
      "J": "Colegas de trabalho.",
      "K": "Outro grupo.",
    },
    {
      "codigo": "QE_I21",
      "A": "Sim.",
      "B": "Não.",
    },
    {
      "codigo": "QE_I22",
      "A": "Nenhum.",
      "B": "Um ou dois.",
      "C": "De três a cinco.",
      "D": "De seis a oito.",
      "E": "Mais de oito.",
    },
    {
      "codigo": "QE_I23",
      "A": "Nenhuma, apenas assisto às aulas.",
      "B": "De uma a três.",
      "C": "De quatro a sete.",
      "D": "De oito a doze.",
      "E": "Mais de doze.",
    },
    {
      "codigo": "QE_I24",
      "A": "Sim, somente na modalidade presencial.",
      "B": "Sim, somente na modalidade semipresencial.",
      "C":
          "Sim, parte na modalidade presencial e parte na modalidade semipresencial.",
      "D": "Sim, na modalidade a distância.",
      "E": "Não.",
    },
    {
      "codigo": "QE_I25",
      "A": "Inserção no mercado de trabalho.",
      "B": "Influência familiar.",
      "C": "Valorização profissional.",
      "D": "Prestígio Social.",
      "E": "Vocação.",
      "F": "Oferecido na modalidade a distância.",
      "G": "Baixa concorrência para ingresso.",
      "H": "Outro motivo.",
    },
    {
      "codigo": "QE_I26",
      "A": "Gratuidade.",
      "B": "Preço da mensalidade.",
      "C": "Proximidade da minha residência.",
      "D": "Proximidade do meu trabalho.",
      "E": "Facilidade de acesso.",
      "F": "Qualidade/reputação.",
      "G": "Foi a única onde tive aprovação.",
      "H": "Possibilidade de ter bolsa de estudo.",
      "I": "Outro motivo.",
    },
    {
      "codigo": "QE_I127",
      "1": "Discordo totalmente.",
      "2": "Discordo.",
      "3": "Discordo parcialmente.",
      "4": "Concordo parcialmente.",
      "5": "Concordo.",
      "6": "Concordo totalmente.",
      "7": "Não se aplica.",
      "8": "Não sei responder.",
    },
  ];

  static List<String> defaultQuestionsOptions = [
    "QE_I28",
    "QE_I29",
    "QE_I30",
    "QE_I31",
    "QE_I32",
    "QE_I33",
    "QE_I34",
    "QE_I35",
    "QE_I36",
    "QE_I37",
    "QE_I38",
    "QE_I39",
    "QE_I40",
    "QE_I41",
    "QE_I42",
    "QE_I43",
    "QE_I44",
    "QE_I45",
    "QE_I46",
    "QE_I47",
    "QE_I48",
    "QE_I49",
    "QE_I50",
    "QE_I51",
    "QE_I52",
    "QE_I53",
    "QE_I54",
    "QE_I55",
    "QE_I56",
    "QE_I57",
    "QE_I58",
    "QE_I59",
    "QE_I60",
    "QE_I61",
    "QE_I62",
    "QE_I63",
    "QE_I64",
    "QE_I65",
    "QE_I66",
    "QE_I67",
    "QE_I68"
  ];

  static String getCourseByGroup(int group) {
    for (int i = 0; i < Constants.listGrupoCursos.length; i++) {
      if (Constants.listGrupoCursos[i]['codigo'] == group) {
        return Constants.listGrupoCursos[i]['nome'];
      }
    }

    return "Não encontrado";
  }

  static Color getColor(int index) {
    final list = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.orangeAccent,
      Colors.teal,
      Colors.brown,
      Colors.deepOrange[900],
      Colors.greenAccent[400],
      Colors.deepPurple
    ];

    if (list.length - 1 >= index) {
      return list[index];
    } else {
      return list[0];
    }
  }

  static bool isDefaultQuestios(String codeQuestion) {
    for (int i = 0; i < Constants.defaultQuestionsOptions.length; i++) {
      if (Constants.defaultQuestionsOptions[i] == codeQuestion) {
        return true;
      }
    }
    return false;
  }

  static String getDescriptionQuestion(String codeQuestion, String option) {
    if (option == "NaN") {
      return "Não respondido";
    } else if (Constants.isDefaultQuestios(codeQuestion)) {
      if (option == "1") {
        return "Discordo totalmente.";
      } else if (option == "2") {
        return "Discordo.";
      } else if (option == "3") {
        return "Discordo parcialmente.";
      } else if (option == "4") {
        return "Concordo parcialmente.";
      } else if (option == "5") {
        return "Concordo.";
      } else if (option == "6") {
        return "Concordo totalmente.";
      } else if (option == "7") {
        return "Não se aplica.";
      } else {
        return "Não sei responder.";
      }
    } else {
      for (int i = 0; i < Constants.questions.length; i++) {
        if (Constants.questions[i]['codigo'] == codeQuestion) {
          return questions[i][option];
        }
      }
    }
  }
}
