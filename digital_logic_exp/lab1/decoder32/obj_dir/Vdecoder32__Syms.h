// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VDECODER32__SYMS_H_
#define VERILATED_VDECODER32__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vdecoder32.h"

// INCLUDE MODULE CLASSES
#include "Vdecoder32___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vdecoder32__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vdecoder32* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vdecoder32___024root           TOP;

    // CONSTRUCTORS
    Vdecoder32__Syms(VerilatedContext* contextp, const char* namep, Vdecoder32* modelp);
    ~Vdecoder32__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
