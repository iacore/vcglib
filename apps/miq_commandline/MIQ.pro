include (./predefinitions.pro)

QT       += core
QT       -= gui

TARGET = miq

TEMPLATE = app

# This is needed by CoMISo
DEFINES += INCLUDE_TEMPLATES
INCLUDEPATH += $$COMISODIR/include
INCLUDEPATH += $$COMISODIR/Solver
INCLUDEPATH += $$COMISODIR/..

# include of vcg library
INCLUDEPATH += $$VCGLIBDIR

# CORE
HEADERS += $$VCGLIBDIR/wrap/miq/core/vertex_indexing.h \
HEADERS += $$VCGLIBDIR/wrap/miq/core/poisson_solver.h
HEADERS += $$VCGLIBDIR/wrap/miq/quadrangulator.h
HEADERS += $$VCGLIBDIR/wrap/miq/core/param_stats.h
HEADERS += $$VCGLIBDIR/wrap/miq/MIQ.h
HEADERS += $$VCGLIBDIR/wrap/miq/core/glUtils.h
HEADERS += $$VCGLIBDIR/wrap/miq/core/seams_initializer.h
HEADERS += $$VCGLIBDIR/wrap/miq/core/stiffening.h
#SOURCES += $$VCGLIBDIR/wrap/miq/MIQ.cpp

# VCG
HEADERS += $$VCGLIBDIR/vcg/complex/algorithms/parametrization/tangent_field_operators.h
HEADERS += $$VCGLIBDIR/vcg/complex/algorithms/parametrization/distortion.h
HEADERS += $$VCGLIBDIR/wrap/io_trimesh/import_field.h
HEADERS += $$VCGLIBDIR/wrap/io_trimesh/export_field.h
SOURCES += $$VCGLIBDIR/wrap/ply/plylib.cpp
SOURCES += main.cpp

# Awful problem with windows..
win32{
  DEFINES += NOMINMAX
}

mac{
# Mac specific Config required to avoid to make application bundles
  CONFIG   += console
  CONFIG   -= app_bundle
  LIBS += -framework OpenGL
  LIBS += -L/opt/local/lib -lamd -lcamd -lccolamd -lcholmod -lcolamd -lcxsparse -lblas -framework accelerate
}


