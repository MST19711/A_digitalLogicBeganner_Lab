// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdecoder32.h for the primary calling header

#include "Vdecoder32__pch.h"
#include "Vdecoder32___024root.h"

VL_ATTR_COLD void Vdecoder32___024root___eval_static(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vdecoder32___024root___eval_initial(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_initial\n"); );
}

VL_ATTR_COLD void Vdecoder32___024root___eval_final(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_final\n"); );
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__stl(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vdecoder32___024root___eval_phase__stl(Vdecoder32___024root* vlSelf);

VL_ATTR_COLD void Vdecoder32___024root___eval_settle(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_settle\n"); );
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelf->__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vdecoder32___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("Design Sources/decoder32.v", 22, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vdecoder32___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelf->__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__stl(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ vlSelf->__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

void Vdecoder32___024root___ico_sequent__TOP__0(Vdecoder32___024root* vlSelf);

VL_ATTR_COLD void Vdecoder32___024root___eval_stl(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_stl\n"); );
    // Body
    if ((1ULL & vlSelf->__VstlTriggered.word(0U))) {
        Vdecoder32___024root___ico_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vdecoder32___024root___eval_triggers__stl(Vdecoder32___024root* vlSelf);

VL_ATTR_COLD bool Vdecoder32___024root___eval_phase__stl(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_phase__stl\n"); );
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vdecoder32___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelf->__VstlTriggered.any();
    if (__VstlExecute) {
        Vdecoder32___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__ico(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ vlSelf->__VicoTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__act(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ vlSelf->__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__nba(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ vlSelf->__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vdecoder32___024root___ctor_var_reset(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->INPUT = VL_RAND_RESET_I(5);
    vlSelf->OUTPUT = VL_RAND_RESET_I(32);
}
