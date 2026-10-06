# Sources and scope

The mathematical source is Robert J. Daverman, *Decompositions of Manifolds*, [section 4, Proposition 2 and Theorem 3](https://www.maths.ed.ac.uk/~v1ranick/papers/daverman.pdf#page=31), printed pages 18 and 19 (PDF pages 31 and 32). These statements and their proofs were read directly. The theorem treats closed maps between Hausdorff spaces with compact fibers. This package proves the continuous-surjection case for compact Hausdorff domain and codomain. No endorsement from the source author is claimed.

The quotient identifies exactly the points in the same connected component of a fiber. To show that the relation is closed, the proof separates two components inside a compact fiber by a clopen set. The two compact pieces have disjoint ambient open neighborhoods. Closedness of the original map gives a neighborhood in the codomain whose full preimage stays in their union. A connected fiber component cannot cross this separation. Compact projection then makes the quotient map closed, and normal separation gives Hausdorffness of the quotient.

For lightness, the proof takes the closure of a preconnected subset of an induced fiber. Mathlib's theorem on connected preimages of closed connected sets makes its preimage connected. That preimage lies in one original fiber component, so its quotient image is a singleton. Uniqueness compares the kernels of two factorizations and constructs the resulting commuting homeomorphism.

The statements require neither a metric nor local connectedness. They permit empty spaces. The uniqueness theorem uses only the continuity and surjectivity of the two first maps, their connected fibers, the lightness of the two second maps, and the factorization identities, in the compact Hausdorff setting.

Source scans at the pinned Mathlib revision found no equivalent full factorization among the matched candidates. Nearby results concern the quotient by the components of an entire space, connected preimages, and compact-to-Hausdorff homeomorphisms. The private evidence records scan patterns, coverage and hashes. This is a qualified duplicate assessment, not a proof of absence.

Earlier permitted caches supplied Mathlib source and complete module artifact families. No earlier topology project is a proof dependency. Resource-control, verification and packaging scripts were adapted from the prior standalone pipeline under Apache 2.0. Byte provenance of cached artifacts does not establish a rebuild from the corresponding source.

Copyright attribution is Arthur Freitas Ramos, David Barros Hulak and Ruy Jose Guerra Barretto de Queiroz. The metadata records automation, the source, mathematical scope and review limits. No public repository mutation or registry submission was performed by this task.
