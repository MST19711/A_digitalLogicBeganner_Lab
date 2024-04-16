// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vdecoder32.h for the primary calling header

#ifndef VERILATED_VDECODER32___024ROOT_H_
#define VERILATED_VDECODER32___024ROOT_H_  // guard

#include "verilated.h"


class Vdecoder32__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vdecoder32___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(INPUT,4,0);
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VicoFirstIteration;
    CData/*0:0*/ __VactContinue;
    VL_OUT(OUTPUT,31,0);
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vdecoder32__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vdecoder32___024root(Vdecoder32__Syms* symsp, const char* v__name);
    ~Vdecoder32___024root();
    VL_UNCOPYABLE(Vdecoder32___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
