- [По этой ссылке дополнительная шпаргалка по синтаксису markdown (маркдаун) со всеми самыми популярными тегами](http://ilfire.ru/kompyutery/shpargalka-po-sintaksisu-markdown-markdaun-so-vsemi-samymi-populyarnymi-tegami)
- [Еще одна шпаргалка по MarkDown](https://daringfireball.net/projects/markdown/syntax)
- [Еще одна шпаргалка](https://paulradzkov.com/2014/markdown_cheatsheet/)
- [Ну вобщем ещ одна](http://bustep.ru/markdown/shpargalka-po-markdown.html)

# [Markdown Guide](https://joplinapp.org/markdown)

Синтаксис Mermaid используется для создания диаграмм. Вы обнаружите, что это не так уж сложно, и выучить его можно за день. [На этой странице](https://mermaid-js.github.io/mermaid/#/./n00b-syntaxReference) подробно рассматривается синтаксис каждого типа диаграммы. Примеры диаграмм можно найти в редакторе [Mermaid Live Editor](https://mermaid-js.github.io/mermaid-live-editor), это также отличное место для практики.

```mermaid
graph TD;
    A-->B-->D;
    A-->C;
    B-->A-->D;
    C-->D;


```

* * *

$$
f(x) = \int_{-\infty}^\infty
	\hat f(\xi)\,e^{2 \pi i \xi x}
	\,d\xi


$$

* * *

$$
EXPRESSION


$$

* * *

[Основы таблиц](https://fletcher.github.io/MultiMarkdown-6/syntax/tables.html)

| First Header | Second Header | Third Header |
| ---: | :---: | :--- |
| Grouping |     |     |
| Content | *Long Cell* |     |
| Content | **Cell** | Cell |
| New section | More | Data |
| And more | With an escaped ‘\|’ |     |
| Content Cell | **`Content Cell`** |     |
| Content Cell | Content Cell |     |

Отступ табуляцией или 4 пробела для неформатированного текста.

Этот текст не будет форматироваться:

```
Robert'); DROP TABLE students;-- 
```

* * *

Вот небольшой код JavaScript:

```
function hello() {
    alert('hello');
}
```

Language is normally auto-detected, but it can also be specified:

```sql
SELECT * FROM users;
DELETE FROM sessions;
```

* * *

`А вот пример того как можно выделить текст` **`А вот пример того как можно выделить жирный текст`** *`А вот пример того как можно выделить курсивный текст`* ***`А вот пример того как можно выделить курсивно-жирный текст`***

* * *

This is `someJavaScript()`

* * *

1.  Introduction
2.  Main topic
    1.  First sub-topic
    2.  Second sub-topic
3.  Conclusion

* * *

- Milk
- Eggs
- Beers
    - Desperados
    - Heineken
- Ham

* * *

> Kent. Where’s the king?

> Gent. Contending with the fretful elements

* * *

This is some *italic text* This is some **bold text**

###### Heading 6

##### Heading 5

#### Heading 4

### Heading 3

## Heading 2

# Heading 1

* * *

Ссылка на блокнот [APPs Man and info](:/5ee61ae6d2ed46329bd7de1c79aec5e6)

* * *

$\sqrt{3x-1}+(1+x)^2$

$EXPRESSION$

$$
f(x) = \int_{-\infty}^\infty
	\hat f(\xi)\,e^{2 \pi i \xi x}
	\,d\xi


$$

$$
EXPRESSION


$$

* * *

[О mhchem для MathJax и KaTeX](https://mhchem.github.io/MathJax-mhchem "Инструмент для простого написания красивых химических и математических уравнений")

[About Mermaid](https://mermaid-js.github.io/mermaid/#/?id=about-mermaid)

* * *

- [ ] Milk
- [x] Rice
- [ ] Eggs

* * *

This is ~~strikethrough text~~ mixed with regular **Markdown**.

```fountain
Добавлена поддержка 
языка разметки Fountain, 
языка разметки обычного 
текста для написания сценариев.


EXT
EST
INT./EXT
INT/EXT
I/E

```

* * *

==marked - Это вариант маркировки в Маркдаун==

* * *

Добавляет оглавление к месту на странице toc. На основе заголовков и подзаголовков

- [Another rule:](#another-rule)
    - [Heading 6](#heading-6)
    - [Heading 5](#heading-5)
    - [Heading 4](#heading-4)
    - [Heading 3](#heading-3)
- [Heading 2](#heading-2)
- [Heading 1](#heading-1)

* * *

X<sub>1</sub>

H<sub>2</sub>O

X<sup>2</sup>Y

* * *

Simples inline footnote <sup>[\[1\]](#fn1)</sup>

Simples inline footnote <sup>[\[2\]](#fn2)</sup>

Simples inline footnote <sup>[\[3\]](#fn3)</sup>

Simples inline footnote <sup>[\[4\]](#fn4)</sup>

* * *

The HTML specification is maintained by the W3C.

* * *

<ins>inserted</ins>

* * *

1.  Nebilime eee. [↩︎](#fnref1)
    
2.  2 [↩︎](#fnref2)
    
3.  3 [↩︎](#fnref3)
    
4.  I’m inline! [↩︎](#fnref4)