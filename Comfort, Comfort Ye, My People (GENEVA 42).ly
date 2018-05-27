%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\paper {
  fonts = #
  (make-pango-font-tree
   "Helvetica"
   "Cloister Black"
   "Andale Mono"
   (/ (* staff-height pt) 2.5))
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Comfort, Comfort Ye, My People"  }
  meter = \markup { \small { Music: GENEVA 42, 87.87.77.88.; L. Bourgeois, 1551; harm. C. Goudimel, 1564 } }
  piece = \markup { \small {Text: \large% \override #'(font-name . "CloisterBlack") 
                            \sans "Tröstet, tröstet, meine Lieben," J. Olearius, 1671; tr. C. Winkworth, 1863 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}


global = {
  \key f \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  f2 g4 a2 g4 \bar "|"
  f e d2 c \bar "|"
  f2 g4 a2 bf4 \bar "|"
  a2 g2 f1 \bar "||"

  f2 g4 a2 g4 \bar "|"
  f e d2 c \bar "|"
  f2 g4 a2 bf4 \bar "|"
  a2 g2 f1 \bar "||"

  a2 a4 c2 bf4 \bar "|"
  a g a1 \bar "|"
  c2 c4 d2 c4 \bar "|"
  bf4 a g1 \bar "||"

  a2 c4 bf2 a4 \bar "|"
  f4 g a2 f \bar "|"
  a2 a4 bf2 a4 \bar "|"
  g f e2 f2 \bar "|."
}

alto = \relative c' {
  \global
  c2 e4 f2 e4
  d c bf2 a
  c2 e4 f2 f4
  f2 e c1

  c2 e4 f2 e4
  d c bf2 a
  c e4 f2 f4
  f2 e c1

  f2 f4 f2 f4
  f e f1
  f2 f4 f2 f4
  f f e1

  a2 g4 g2 f4
  d c c2 d
  c2 f4 f2 f4
  e a, c2 c2
}

tenor = \relative c' {
  \global
  a2 c4 c2 c4
  a a f2 f
  a2 c4 c2 d4
  c2 c a1

  a2 c4 c2 c4
  a a f2 f
  a2 c4 c2 d4
  c2 c a1

  c2 c4 c2 d4
  c c c1

  a2 a4 bf2 c4
  d c c1
  c2 ef4 d2 d4
  a g f2 f

  f c'4 d2 c4
  c f, g2 a
}

bass = \relative c {
  \global
  f2 c4 f2 c4
  d a bf2 f
  f'2 c4 f2 bf,4
  f'2 c f,1

  f'2 c4 f2 c4
  d a bf2 f
  f' c4 f2 bf,4
  f'2 c f,1

  f'2 f4 a,2 bf4
  f' c f1
  f2 f4 bf,2 a4
  bf4 f' c1

  f2 c4 g'2 d4
  d e f2 bf,
  f'2 f4 bf,2 f'4
  c d c2 f
}

verseOne = \lyricmode {
  \set stanza = "1."
  Com -- fort, com -- fort ye my peo -- ple,
  Speak ye peace, thus saith our God;
  Com -- fort those who sit in dark -- ness,
  Mourn -- ing 'neath their sor -- rows' load;
  Speak ye to Je -- ru -- sa -- lem
  Of the peace that waits for them,
  Tell her that her sins I cov -- er,
  And her war -- fare now is o -- ver.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Yea, her sins our God will par -- don,
  Blot -- ting out each dark mis -- deed;
  All that well de -- served His an -- ger
  He will no more see nor heed.
  She hath suf -- fer'd man -- y_a day,
  Now her griefs have passed a -- way,
  God will change her pin -- ing sad -- ness
  In -- to ev -- er -- sping -- ing glad -- ness.
}

verseThree = \lyricmode {
  \set stanza = "3."
  For E -- li -- jah's voice is cry -- ing
  In the des -- ert far and near,
  Bid -- ding all men to re -- pent -- ance,
  Since the king -- dom now is here.
  O that warn -- ing cry o -- bey!
  Now pre -- pare for God a way!
  Let the val -- leys rise to meet him,
  And the hills bow down to greet him.
}


verseFour = \lyricmode {
  \set stanza = "4."
  Make ye straight what long was crook -- ed,
  Make the rough -- er plac -- es plain:
  Let your hearts be true and hum -- ble,
  As be -- fits his ho -- ly reign,
  For the glo -- ry of the Lord
  Now o'er the_earth is shed a -- broad,
  And all flesh shall see the to -- ken
  That his word is nev -- er bro -- ken.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 112 4)
    }
  }
  \layout {}
}

