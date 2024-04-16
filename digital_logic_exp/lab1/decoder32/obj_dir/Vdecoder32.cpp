// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vdecoder32__pch.h"

//============================================================
// Constructors

Vdecoder32::Vdecoder32(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vdecoder32__Syms(contextp(), _vcname__, this)}
    , INPUT{vlSymsp->TOP.INPUT}
    , OUTPUT{vlSymsp->TOP.OUTPUT}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vdecoder32::Vdecoder32(const char* _vcname__)
    : Vdecoder32(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vdecoder32::~Vdecoder32() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vdecoder32___024root___eval_debug_assertions(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG
void Vdecoder32___024root___eval_static(Vdecoder32___024root* vlSelf);
void Vdecoder32___024root___eval_initial(Vdecoder32___024root* vlSelf);
void Vdecoder32___024root___eval_settle(Vdecoder32___024root* vlSelf);
void Vdecoder32___024root___eval(Vdecoder32___024root* vlSelf);

void Vdecoder32::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vdecoder32::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vdecoder32___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vdecoder32___024root___eval_static(&(vlSymsp->TOP));
        Vdecoder32___024root___eval_initial(&(vlSymsp->TOP));
        Vdecoder32___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vdecoder32___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vdecoder32::eventsPending() { return false; }

uint64_t Vdecoder32::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vdecoder32::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vdecoder32___024root___eval_final(Vdecoder32___024root* vlSelf);

VL_ATTR_COLD void Vdecoder32::final() {
    Vdecoder32___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vdecoder32::hierName() const { return vlSymsp->name(); }
const char* Vdecoder32::modelName() const { return "Vdecoder32"; }
unsigned Vdecoder32::threads() const { return 1; }
void Vdecoder32::prepareClone() const { contextp()->prepareClone(); }
void Vdecoder32::atClone() const {
    contextp()->threadPoolpOnClone();
}
