// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdecoder32.h for the primary calling header

#include "Vdecoder32__pch.h"
#include "Vdecoder32__Syms.h"
#include "Vdecoder32___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__ico(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG

void Vdecoder32___024root___eval_triggers__ico(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_triggers__ico\n"); );
    // Body
    vlSelf->__VicoTriggered.set(0U, (IData)(vlSelf->__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vdecoder32___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__act(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG

void Vdecoder32___024root___eval_triggers__act(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_triggers__act\n"); );
    // Body
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vdecoder32___024root___dump_triggers__act(vlSelf);
    }
#endif
}
