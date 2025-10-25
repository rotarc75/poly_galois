#import "lecture.typ": *


#let quot(k, p) = {
  let offset = 2pt
  let num = move(dy: -offset, $#k$)
  let denom = move(dy: offset, $#p$)
  $lr(num mid("/") denom, size: #(125% + 2*offset))$
}
