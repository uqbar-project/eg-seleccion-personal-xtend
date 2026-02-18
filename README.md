
# Ejercicio de Diseño - Selección de Personal

[![Build & Test](https://github.com/uqbar-project/eg-seleccion-personal-xtend/actions/workflows/build.yml/badge.svg)](https://github.com/uqbar-project/eg-seleccion-personal-xtend/actions/workflows/build.yml) [![codecov](https://codecov.io/gh/uqbar-project/eg-seleccion-personal-xtend/graph/badge.svg?token=Wxg7KM0JcQ)](https://codecov.io/gh/uqbar-project/eg-seleccion-personal-xtend)

<img src="images/personal.png" height="130px" width="130px"/>

## Dominio
El enunciado está [aquí](https://docs.google.com/viewer?a=v&pid=sites&srcid=ZGVmYXVsdGRvbWFpbnx1dG5kZXNpZ258Z3g6MzNhMGQyNGNmM2U5MzM2Ng)

## Objetivo

* Muestra cómo implementar el double dispatch que Gamma explica dentro del patrón Visitor.
* Tiene varios test cases que resuelven el ejercicio Selección de personal.
* Como feature incorpora un **extension method** DateUtil para obtener la antigüedad del empleado y lo delega en objetos del framework Joda-time.

## Branches

* [__double-dispatch__](https://github.com/uqbar-project/eg-seleccion-personal-xtend/tree/double-dispatch): trabaja con double dispatch manual
* [__dispatch__](https://github.com/uqbar-project/eg-seleccion-personal-xtend/tree/dispatch): trabaja con method dispatch de xtend

