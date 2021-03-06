%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "O Little Town of Bethlehem"  }
  meter = \markup { \small { Music: FOREST GREEN, 8.6.8.6 D; English, harm. R.V. Williams, 1906 } }
  piece = \markup { \small {Text: Phillips Brooks, 1868 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  c4 |
  f f f g |
  \set melismaBusyProperties = #'() \slurDashed a8[( g] a[ bf]) \unset melismaBusyProperties c4 \bar "||"

  a4 |
  bf a8[ f] g4 g |
  f2. \bar "||" \break

  c4 |
  f f f g |
  \set melismaBusyProperties = #'() \slurDashed a8[( g] a[ bf]) \unset melismaBusyProperties c4 \bar "||"

  a4 |
  bf a8[ f] g4 g |
  f2. \bar "||" \break

  f8[ a] |
  c4. d8 c[ bf] a[ g] |
  f[ g a bf] c4 \bar "||"

  c,4 |
  f a g f |
  c2 \bar "||"

  c2 |
  f4 f f g |
  a8[ g] a[ bf] c4 \bar "||"

  a4 |
  bf a8[ f] g4 g |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c d c d8[ e] |
  f4 f e

  d |
  d f f e |
  f2.

  c4 |
  c d c d8[ e] |
  f4 f e

  d |
  d f f e |
  f2.

  f4 |
  f4. d8 e4 c |
  c( f) e

  c |
  c c bf a8[ bf] |
  c2

  c2 |
  c4 d c d8[ e] |
  f4 f e

  d |
  d f f e |
  f2. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4
  g4 |
  a bf c bf |
  c f, g

  g |
  bf c d c8[ bf] |
  a2.

  g4 |
  a bf c bf |
  c f, g

  g |
  bf c d c8[ bf] |
  a2.

  a4 |
  a4. f8 c'4 c8[ bf] |
  a4( f) g

  e4 |
  f f d8[ e] f4 |
  e2

  f4( g) |
  a bf c bf |
  c f, g

  f |
  bf c8[ a] c4 c8[ bf] |
  a2. \bar "|."
}

bass = \relative c {
  \global
  \partial 4
  e4 |
  f bf a g |
  f d c

  d |
  g, a bf c |
  f2.

  e4 |
  f bf a g |
  f d c

  d |
  g, a bf c |
  f2.

  d4 |
  a4. bf8 c4 d8[ e] |
  f4( d) c

  c8[ bf] |
  a4 f bf d |
  c2

  d4( e) |
  f bf a g |
  f d c

  d |
  g, a8[ d] c4 c |
  <<{\voiceTwo f2.} \\ {\voiceFour \once \override NoteColumn #'force-hshift = #0.4 \override NoteHead #'font-size = #-3 f,2._\markup {\tiny Org.} } >>
  \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  O lit -- tle town of Beth -- _ le -- _ hem,
  How still we see thee lie!
  A -- bove thy deep and dream -- _ less _ sleep
  The si -- lent stars go by.
  Yet in thy dark streets shin -- eth
  The ev -- er -- last -- ing Light;
  The hopes and fears of all the years
  Are met in thee to -- night.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  For Christ is born of Mar -- _ _ _ y,
  And gath -- ered all a -- bove,
  While mor -- tals sleep, the an -- _ gels _ keep
  Their watch of won -- d'ring love.
  O morn -- ing stars to -- geth -- er,
  Pro -- claim the ho -- ly birth,
  And prais -- es sing to God the King,
  And peace to men on earth!
}

verseThree = \lyricmode {
  \set stanza = "3."
  How si -- lent -- ly, how si -- _ lent -- _ ly,
  The won -- drous Gift is giv’n;
  So God im -- parts to hu -- _ man _ hearts
  The bles -- sings of His Heav’n.
  No ear may hear His com -- ing,
  But in this world of sin,
  Where meek souls will re -- ceive Him still,
  The dear Christ en -- ters in.
}

%%% if more verses are needed in between the musical staves, uncomment this section
%{
verseFour = \lyricmode {
	\set stanza = "4."

}
%}

\score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melody }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout { }
}

\markup {
  \large {
    \fill-line {
      \hspace #1.0
      \column {
        \line {
          \bold "4. "
          \column {
            "Where children pure and happy"
            "  Pray to the blessèd Child,"
            "Where misery cries out to Thee,"
            "  Son of the mother mild;"
            "Where charity stands watching"
            "  And faith holds wide the door,"
            "The dark night wakes, the glory breaks,"
            "  And Christmas comes once more."
          }
        }
        \vspace #1
        \line {
          \bold "5. "
          \column {
            "O holy Child of Bethlehem,"
            "  Descend to us, we pray;"
            "Cast out our sin, and enter in,"
            "  Be born in us today."
            "We hear the Christmas Angels"
            "  The great glad tidings tell;"
            "O come to us, abide with us,"
            "  Our Lord Emmanuel!"
          }
        }
      }
      \hspace #1.0

    }
  }
}

