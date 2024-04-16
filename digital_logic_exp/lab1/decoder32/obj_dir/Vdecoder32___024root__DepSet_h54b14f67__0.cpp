// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vdecoder32.h for the primary calling header

#include "Vdecoder32__pch.h"
#include "Vdecoder32___024root.h"

void Vdecoder32___024root___ico_sequent__TOP__0(Vdecoder32___024root* vlSelf);

void Vdecoder32___024root___eval_ico(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vdecoder32___024root___ico_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vdecoder32___024root___ico_sequent__TOP__0(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->OUTPUT = (((0x1fU == (IData)(vlSelf->INPUT)) 
                       << 0x1fU) | (((0x1eU == (IData)(vlSelf->INPUT)) 
                                     << 0x1eU) | ((
                                                   (0x1dU 
                                                    == (IData)(vlSelf->INPUT)) 
                                                   << 0x1dU) 
                                                  | (((0x1cU 
                                                       == (IData)(vlSelf->INPUT)) 
                                                      << 0x1cU) 
                                                     | (((0x1bU 
                                                          == (IData)(vlSelf->INPUT)) 
                                                         << 0x1bU) 
                                                        | (((0x1aU 
                                                             == (IData)(vlSelf->INPUT)) 
                                                            << 0x1aU) 
                                                           | (((0x19U 
                                                                == (IData)(vlSelf->INPUT)) 
                                                               << 0x19U) 
                                                              | (((0x18U 
                                                                   == (IData)(vlSelf->INPUT)) 
                                                                  << 0x18U) 
                                                                 | (((0x17U 
                                                                      == (IData)(vlSelf->INPUT)) 
                                                                     << 0x17U) 
                                                                    | (((0x16U 
                                                                         == (IData)(vlSelf->INPUT)) 
                                                                        << 0x16U) 
                                                                       | (((0x15U 
                                                                            == (IData)(vlSelf->INPUT)) 
                                                                           << 0x15U) 
                                                                          | (((0x14U 
                                                                               == (IData)(vlSelf->INPUT)) 
                                                                              << 0x14U) 
                                                                             | (((0x13U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0x13U) 
                                                                                | (((0x12U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0x12U) 
                                                                                | (((0x11U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0x11U) 
                                                                                | (((0x10U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0x10U) 
                                                                                | (((0xfU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xfU) 
                                                                                | (((0xeU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xeU) 
                                                                                | (((0xdU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xdU) 
                                                                                | (((0xcU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xcU) 
                                                                                | (((0xbU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xbU) 
                                                                                | (((0xaU 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 0xaU) 
                                                                                | (((9U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 9U) 
                                                                                | (((8U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 8U) 
                                                                                | (((7U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 7U) 
                                                                                | (((6U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 6U) 
                                                                                | (((5U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 5U) 
                                                                                | (((4U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 4U) 
                                                                                | (((3U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 3U) 
                                                                                | (((2U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 2U) 
                                                                                | (((1U 
                                                                                == (IData)(vlSelf->INPUT)) 
                                                                                << 1U) 
                                                                                | (0U 
                                                                                == (IData)(vlSelf->INPUT)))))))))))))))))))))))))))))))));
}

void Vdecoder32___024root___eval_triggers__ico(Vdecoder32___024root* vlSelf);

bool Vdecoder32___024root___eval_phase__ico(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_phase__ico\n"); );
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vdecoder32___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelf->__VicoTriggered.any();
    if (__VicoExecute) {
        Vdecoder32___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vdecoder32___024root___eval_act(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_act\n"); );
}

void Vdecoder32___024root___eval_nba(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_nba\n"); );
}

void Vdecoder32___024root___eval_triggers__act(Vdecoder32___024root* vlSelf);

bool Vdecoder32___024root___eval_phase__act(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<0> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vdecoder32___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vdecoder32___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vdecoder32___024root___eval_phase__nba(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vdecoder32___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__ico(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__nba(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vdecoder32___024root___dump_triggers__act(Vdecoder32___024root* vlSelf);
#endif  // VL_DEBUG

void Vdecoder32___024root___eval(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelf->__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY((0x64U < __VicoIterCount))) {
#ifdef VL_DEBUG
            Vdecoder32___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("Design Sources/decoder32.v", 22, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vdecoder32___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelf->__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vdecoder32___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("Design Sources/decoder32.v", 22, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vdecoder32___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("Design Sources/decoder32.v", 22, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vdecoder32___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vdecoder32___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vdecoder32___024root___eval_debug_assertions(Vdecoder32___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vdecoder32__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vdecoder32___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->INPUT & 0xe0U))) {
        Verilated::overWidthError("INPUT");}
}
#endif  // VL_DEBUG
