# MD Examples

## 1. Headings
```markdown
# H1
## H2
### H3
#### H4
##### H5
###### H6
```
# H1  
## H2  
### H3  
#### H4  
##### H5  
###### H6  

---

## 2. Emphasis
```markdown
*Italic*  
_Italic_  
**Bold**  
__Bold__  
~~Strikethrough~~  
**Bold and _italic_**
```

*Italic*  
_Italic_  
**Bold**  
__Bold__  
~~Strikethrough~~  
**Bold and _italic_**

---

## 3. Lists
### Unordered
```markdown
- Item 1
- Item 2
  - Subitem
    - Nested
```

- Item 1
- Item 2
  - Subitem
    - Nested

### Ordered
```markdown
1. First
2. Second
   1. Subitem
```

1. First
2. Second
   1. Subitem

---

## 4. Links
```markdown
https://github.com
```
https://github.com

---

## 5. Images
```markdown
![GitHub Logo](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)
```
![GitHub Logo](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)

---

## 6. Blockquotes
```markdown
> This is a blockquote
>> Nested blockquote
```

> This is a blockquote  
>> Nested blockquote

---

## 7. Code
### Inline
```markdown
`inline code`
```
`inline code`

### Code Block
```python
def hello():
    print("Hello, GitHub!")
```

```python
def hello():
    print("Hello, GitHub!")
```

---

## 8. Tables
```markdown
| Column 1 | Column 2 |
|----------|----------|
| Row 1    | Data     |
| Row 2    | Data     |
```

| Column 1 | Column 2 |
|----------|----------|
| Row 1    | Data     |
| Row 2    | Data     |

---

## 9. Task Lists
```markdown
- [x] Completed
- [ ] Incomplete
```

- [x] Completed  
- [ ] Incomplete  

---

## 10. Horizontal Rule
```markdown
---
```
---

## 11. Emoji
```markdown
:smile: :rocket: :tada:
```
:smile: :rocket: :tada:

---

## 12. Mentions & References
```markdown
@username #1234
```
@username #1234

---

## 13. Footnotes
```markdown
Here is a footnote reference[^1].

[^1]: This is the footnote.
```

Here is a footnote reference[^1].

[^1]: This is the footnote.

---

## 14. Links
[example_module](example_module.md)

---

## 15. Syntax Highlighting
```javascript
console.log("Hello, GitHub!");
```

---

## 16. Math (via GitHub's Markdown + LaTeX)
```markdown
$$E = mc^2$$
```
$$E = mc^2$$

## 17. Callouts

> [!NOTE]
> This is a note. Use it for general information.

> [!TIP]
> This is a tip. Helpful advice or best practices go here.

> [!IMPORTANT]
> This is important. Critical information that must be read.

> [!WARNING]
> This is a warning. Indicates potential risks or issues.

> [!CAUTION]
> This is a caution. Advises careful handling or attention.

## 18. Mermaid
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

> *While Obsidian / Github / Gitlab can render these, an external tool may be useful to create/edit complex diagrams*

