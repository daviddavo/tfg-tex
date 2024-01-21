\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tfg-ucm}[2022/03/08]

\RequirePackage{graphicx}
\RequirePackage[a4paper]{geometry}
% \RequirePackage{csquotes}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass[
    12pt,
    chapterprefix,
    parskip=full,
    captions=centeredbeside,
    listof=totoc,
    dvipsnames,
]{scrbook}

\usepackage[dvipsnames]{xcolor}
\RequirePackage{tcolorbox}

% |---------------------------|
% | COSAS GENERALES DE ESTILO |
% |---------------------------|

% Hacer que el título de los capítulos/secciones esté en serif (más profesional)
\addtokomafont{disposition}{\rmfamily}
% Hacer que la parte negrita del entorno `description` esté en fuente serif
\setkomafont{descriptionlabel}{\normalfont\bfseries}

% Ver koma-script guide pagina 140
% default: \setcaphanging
\setcapindent{1em}

%% DICTUM (the quotes at the start of chapters) things
\setkomafont{dictum}{\small\normalfont}
\setkomafont{dictumauthor}{\normalfont}
% more width
\renewcommand*\dictumwidth{.7\linewidth}
% No dictum rule
\renewcommand*\dictumrule{\par}
% Author format
\renewcommand*\dictumauthorformat[1]{-- #1}
% Ragged
% \renewcommand*\raggeddictumtext{\raggedleft}

% |----------------------------|
% | DEFINICIONES DE LA PORTADA |
% |----------------------------|

% https://informatica.ucm.es/file/normativatfg-2021-2022?ver
\newcommand*{\englishTitle}[1]{\def\@englishTitle{#1}}
\newcommand*{\director}[1]{\def\@director{#1}}
\newcommand*{\codirector}[1]{\def\@codirector{#1}}
\newcommand*{\cursoAcademico}[1]{\def\@cursoAcademico{#1}}
\newcommand*{\facultad}[1]{\def\@facultad{#1}}
\newcommand*{\departamento}[1]{\def\@departamento{#1}}
\newcommand*{\universidad}[1]{\def\@universidad{#1}}
\newcommand*{\asignatura}[1]{\def\@asignatura{#1}}
\newcommand*{\universityLogo}[1]{\def\@universityLogo{#1}}

% Portada basada en TeFlOn X de David Pacios Izquierdo
% https://www.ucm.es/oficina-de-software-libre/publicaciones
\newcommand{\makecover}{%
\begin{titlepage}
    \newgeometry{margin=1in}
    \vspace*{5mm}
    \begin{center}
        {\textbf{\LARGE{\@title}} }\\[3mm] %Titulo del TFG
        \textbf{\@englishTitle}\\[7mm]
        
        {\large Por\\}
        \vspace{5mm}
        {\large\textsc{\@author}}\\
        \vspace{10mm}
        \includegraphics[width=7cm]{\@universityLogo}\\ %Logo de la UCM
        \vspace{14mm}
        {\large \@asignatura\\    %Departamento del profesor que es el tutor
        \vspace{2mm}
        \textsc{\@facultad}}\\ %Facultad para la que se hace
        \textbf{\@universidad}\\
        \vspace{11mm}
        \begin{minipage}{10cm}
        \begin{center}
          \@director
          \ifdefined\@codirector \ \& \@codirector \fi\\\vspace{2mm}
          \vspace{2mm}
        \end{center}
        \vspace{4mm}
        
        %Cuadro de presentación del TFG
        \end{minipage}\\
        \vspace{4mm}
        {\large\textsc{Madrid, \@cursoAcademico}} %Fecha de finalización o presentación
        \vspace{12mm}
    \end{center}
    \restoregeometry
\end{titlepage}
}

\newcommand*{\makefirstpage}[0]{
\begin{titlepage}
    \vspace*{5mm}
    \begin{center}
        {\textbf{\LARGE{\@title}} }\\[3mm] %Titulo del TFG
        \textbf{\@englishTitle}\\[7mm]

        \@asignatura \\
        \@facultad \\
        \@departamento \\
        \vspace{6.5mm}
        {\large Autor:}\\
        \textbf{\@author}
        \vspace{6.5mm}
        {\large Dirigida por:}\\
        \@director \\[7mm]
        {Codirigida por:}
        
        {\large \grado\\    %Departamento del profesor que es el tutor
        \textsc{\facultad}}\\ %Facultad para la que se hace
        \vspace{11mm}
        \begin{minipage}{10cm}
        \begin{center}
        \tutor\\
          \textbf{título en inglés}\\
          \vspace{2mm}
        \end{center}
        \vspace{4mm}
        
        %Cuadro de presentación del TFG
        \end{minipage}\\
        \vspace{4mm}
        {\large\textsc{\ciudad, \curso}} %Fecha de finalización o presentación
        \vspace{12mm}
    \end{center}
\end{titlepage}
}


\newtcolorbox{recuadro}[1][]{
    boxrule=1pt, arc=0pt,
    left=3pt, right=3pt, boxsep=0pt,
    colframe=black, colback=lightgray,
    #1,
}

\newtcolorbox{recuadronoc}[1][]{
    boxrule=1pt, arc=0pt,
    left=7pt, right=7pt, boxsep=0pt,
    parbox=false,
    colframe=RoyalBlue, colback=CornflowerBlue!10,
    #1,
}

\newtcolorbox{keywords}[1][] {
    colframe=black, colback=lightgray,
    #1,
}