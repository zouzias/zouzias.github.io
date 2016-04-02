---
layout: post
title: What is a Monad?
tags:
- monad
- math
- functional
- category theory
---

In this post, we provide the minimal category theory background that is required to define a monad.

## Definition of a Category

A category $$\mathcal{C}$$ contains the following:

1. Objects: A sequence of objects, denoted by $$obj(\mathcal{C})$$: $$A, B, C$$
2. Arrows: A sequence of arrows denoted by $$f, g, h$$

The above satisfy the following properties:

1. For each arrow $$f$$, there exist objects $$dom(f)$$ and $$cod(f)$$ called the domain and codomain of $$f$$, respectively. We write $$f: A \to B$$ to indicate $$dom(f)=A$$ and $$cod(f)=B$$.
2. For any two arrows $$f: A \to B$$ and $$g: B \to C$$, there is an arrow $$ g \circ f: A \to C$$ called the composite of $$f$$ and $$g$$.
3. For each object $$A$$, there exist the identity arrow $$1_A : A \to A$$
4. Associativity: $$h \circ (g \circ f) = (h \circ g) \circ f$$
5. Unit: $$f \circ 1_A = 1_B \circ f$$ for every arrow $$f: A \to B$$


## Functor

A *homomorphism of categories* is called a functor. More precisely, we call $$F: \mathcal{C} \to \mathcal{D}$$ between two categories $$\mathcal{C}$$ and $$\mathcal{D}$$, a ***functor*** iff:

1. Arrow preservation: $$F(f: A \to B) := F(f): F(A) \to F(B)$$
2. Identity preservation: $$F(1_A) := 1_{F(A)}$$ for every $$A\in\mathcal{C}$$
3. Composition preservation: $$F(f \circ g) := F(f) \circ F(g)$$

That is, $$F$$ preserves domains and codomains, identity arrows, and composition.

## Natural transformations

Let functors $$F,G: \mathcal{C} \to \mathcal{D}$$.

A ***natural transformation*** $$\eta$$ from $$F$$ to $$G$$ is an assignment to every object $$X\in{obj(\mathcal{C})}$$ of a morphism
 $$\eta_X : F(X) \to G(X)$$ in $$\mathcal{D}$$ such that for every morphism $$f : X \to Y$$ in $$\mathcal{C}$$ we have:

$$\eta_Y \circ F(f) = G(f) \circ \eta_X$$ in $$\mathcal{D}$$

## Monad

If $$\mathcal{C}$$ is a category, a ***monad*** on $$\mathcal{C}$$ is defined as
an endfunctor $$T: \mathcal{C} \to \mathcal{C}$$ equipped with two natural transformations:

$$\eta : 1_{\mathcal{C}} \to T$$

$$ \mu: T^2 \to T$$

The above natural transformations must satisfy: (a) $$\mu \circ T\mu =\mu \circ \mu T$$ and (b) $$\mu \circ T\eta =\mu \circ \eta T = 1_{T}$$


## References

1. [Category Theory by Steve Adowey](http://www.mpi-sws.org/~dreyer/courses/catlogic/awodey.pdf)
