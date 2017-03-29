# Exercises

## Intermission
### Equivalence
1. 𝜆xy.xz is equivalent to 𝜆mn.mz
2. 𝜆xy.xxy is equivalent to 𝜆a(𝜆b.aab)
3. 𝜆xyz.zx is equivalent to 𝜆tos.st

## Chapter
### Combinators
1. yes - there are no free variables in: 𝜆x.xxx
2. no - there is a free variable z in: 𝜆xy.zx
3. yes - there are no free variables in: 𝜆xyz.xy(zx)
4. yes - there are no free variables in: 𝜆xyz.xy(zxy)
5. no - there is a free variable z in: 𝜆xy.xy(zxy)

### Normal or Diverge
1. 𝜆x.xxx can't be reduced anymore and thus it is normal form
2. (𝜆z.zz)(𝜆y.yy) can be reduced to (𝜆y.yy)(𝜆y.yy), reducing again will give the same function, and thus it diverges (never reaches a point where the reduction is done)
3. (𝜆x.xxx)z is reduced to zzz and cannot be reduced further, thus it is normal form

### Beta Reduction
1. (𝜆abc.cba)zz(𝜆wv.w)
```
(𝜆abc.cba)zz(𝜆wv.w)
(𝜆a.𝜆b.𝜆c.cba)(z)z(𝜆w.𝜆v.w) # Made the currying explicit by adding the implied lambdas
(𝜆b.𝜆c.cbz)z(𝜆w.𝜆v.w)
(𝜆c.czz)(𝜆w.𝜆v.w)
(𝜆w.𝜆v.w)(z)z
(𝜆v.z)z
z

(𝜆abc.cba)zz(𝜆wv.w) -> z through beta reduction
```
2. (𝜆x.𝜆y.xyy)(𝜆a.a)b
```
(𝜆x.𝜆y.xyy)(𝜆a.a)b
(𝜆y.(𝜆a.a)yy)b
(𝜆a.a)bb
(𝜆a.a)(b)b
bb

(𝜆x.𝜆y.xyy)(𝜆a.a)b -> bb through beta reduction
```
3. (𝜆y.y)(𝜆x.xx)(𝜆z.zq)
```
(𝜆y.y)(𝜆x.xx)(𝜆z.zq)
(𝜆x.xx)(𝜆z.zq)
(𝜆z.zq)(𝜆z.zq)
(𝜆z.zq)q
qq

(𝜆y.y)(𝜆x.xx)(𝜆z.zq) -> qq through beta reduction
```
4. (𝜆z.z)(𝜆z.zz)(𝜆z.zy)
```
(𝜆z.z)(𝜆z.zz)(𝜆z.zy)
(𝜆z.z)(𝜆a.aa)(𝜆b.bc)
(𝜆a.aa)(𝜆b.bc)
(𝜆b.bc)(𝜆b.bc)
(𝜆b.bc)c
cc

(𝜆z.z)(𝜆z.zz)(𝜆z.zy) -> yy through beta reduction
```
5. (𝜆x.𝜆y.xyy)(𝜆y.y)y
```
(𝜆x.𝜆y.xyy)(𝜆y.y)y
(𝜆y.(𝜆y.y)yy)y
(𝜆y.y)(y)y
yy

(𝜆x.𝜆y.xyy)(𝜆y.y)y -> yy through beta reduction
```
6. (𝜆a.aa)(𝜆b.ba)c
```
(𝜆a.aa)(𝜆b.ba)c
(𝜆b.ba)(𝜆b.ba)c
(𝜆b.ba)(a)c
aac

(𝜆a.aa)(𝜆b.ba)c -> aac through beta reduction
```
7. (𝜆xyz.xz(yz))(𝜆x.z)(𝜆x.a)
```
(𝜆xyz.xz(yz))(𝜆x.z)(𝜆x.a) # Our expression to reduce
(𝜆x.𝜆y.𝜆z.xz(yz))(𝜆x.z)(𝜆x.a) # Made the currying explicit by adding the implied lambdas
(𝜆x.𝜆y.𝜆w.xw(yw))(𝜆x.z)(𝜆x.a) # Renamed z -> w to avoid confusion (since z is found in 2 seperate lambda functions)
(𝜆y.𝜆w.(𝜆x.z)w(yw))(𝜆x.a) # Applied x bound to the argument (𝜆x.z)
(𝜆w.(𝜆x.z)w((𝜆x.a)w)) # Applied y bound to the argument (𝜆x.a)
(𝜆w.z((𝜆x.a)w)) # There were no more arguments to apply to the outer lambda, so we started working on reducing the inner lambda by applying x bound to the argument w for the lambda (𝜆x.z)w
(𝜆w.za) # Again, working on the inner lambda we applied x bound to the argument w for the lambda (𝜆x.a)w

(𝜆xyz.xz(yz))(𝜆x.z)(𝜆x.a) -> 𝜆w.za through beta reduction
```
