/*
 * Do not modify this file; it is automatically generated from the template
 * linkcmd.xdt in the ti.targets.elf package and will be overwritten.
 */

/*
 * put '"'s around paths because, without this, the linker
 * considers '-' as minus operator, not a file name character.
 */


-l"C:\dev\example_apps\vlfft\vlfft\evmc6678l\Debug\configPkg\package\cfg\vlfft_evmc6678l_pe66.oe66"
-l"C:\ti\ipc_1_24_00_16\packages\ti\sdo\ipc\lib\instrumented_e66\ipc\ipc.lib"
-l"C:\ti\bios_6_32_05_54\packages\ti\sysbios\lib\instrumented_e66\sysbios\sysbios.lib"
-l"C:\ti\xdctools_3_22_04_46\packages\ti\targets\rts6000\lib\ti.targets.rts6000.ae66"
-l"C:\ti\xdctools_3_22_04_46\packages\ti\targets\rts6000\lib\boot.ae66"

--retain="*(xdc.meta)"

/* function aliases */
/* ignore error about def and ref in the same file */
--diag_remark=10268
--symbol_map xdc_runtime_System_flush__E=xdc_runtime_System_flush__F
--symbol_map xdc_runtime_Memory_query__E=xdc_runtime_Memory_query__F
--symbol_map ti_sysbios_xdcruntime_GateThreadSupport_leave__E=ti_sysbios_xdcruntime_GateThreadSupport_leave__F
--symbol_map xdc_runtime_System_putch__E=xdc_runtime_System_putch__F
--symbol_map xdc_runtime_Registry_getMask__E=xdc_runtime_Registry_getMask__F
--symbol_map ti_sdo_ipc_GateMP_setRegion0Reserved__E=ti_sdo_ipc_GateMP_setRegion0Reserved__F
--symbol_map ti_sdo_ipc_GateMP_setDefaultRemote__E=ti_sdo_ipc_GateMP_setDefaultRemote__F
--symbol_map ti_sdo_utils_MultiProc_dummy__E=ti_sdo_utils_MultiProc_dummy__F
--symbol_map xdc_runtime_System_avsprintf__E=xdc_runtime_System_avsprintf__F
--symbol_map ti_sdo_ipc_SharedRegion_attach__E=ti_sdo_ipc_SharedRegion_attach__F
--symbol_map ti_sdo_ipc_heaps_HeapBufMP_isBlocking__E=ti_sdo_ipc_heaps_HeapBufMP_isBlocking__F
--symbol_map ti_sdo_ipc_nsremote_NameServerRemoteNotify_get__E=ti_sdo_ipc_nsremote_NameServerRemoteNotify_get__F
--symbol_map ti_sdo_ipc_notifyDrivers_NotifyDriverCirc_sharedMemReq__E=ti_sdo_ipc_notifyDrivers_NotifyDriverCirc_sharedMemReq__F
--symbol_map xdc_runtime_GateNull_query__E=xdc_runtime_GateNull_query__F
--symbol_map ti_sysbios_family_c64p_EventCombiner_enableEvent__E=ti_sysbios_family_c64p_EventCombiner_enableEvent__F
--symbol_map xdc_runtime_Startup_exec__E=xdc_runtime_Startup_exec__F
--symbol_map xdc_runtime_knl_GateThread_enter__E=xdc_runtime_knl_GateThread_enter__F
--symbol_map ti_sdo_ipc_GateMP_start__E=ti_sdo_ipc_GateMP_start__F
--symbol_map xdc_runtime_System_abort__E=xdc_runtime_System_abort__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_dispatchPlug__E=ti_sysbios_family_c66_tci66xx_CpIntc_dispatchPlug__F
--symbol_map ti_sysbios_gates_GateMutexPri_query__E=ti_sysbios_gates_GateMutexPri_query__F
--symbol_map xdc_runtime_Text_matchRope__E=xdc_runtime_Text_matchRope__F
--symbol_map ti_sdo_ipc_SharedRegion_reserveMemory__E=ti_sdo_ipc_SharedRegion_reserveMemory__F
--symbol_map ti_sysbios_syncs_SyncSem_wait__E=ti_sysbios_syncs_SyncSem_wait__F
--symbol_map ti_sdo_ipc_GateMP_getRegion0ReservedSize__E=ti_sdo_ipc_GateMP_getRegion0ReservedSize__F
--symbol_map ti_sdo_ipc_gates_GateHWSem_query__E=ti_sdo_ipc_gates_GateHWSem_query__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_disableAllHostInts__E=ti_sysbios_family_c66_tci66xx_CpIntc_disableAllHostInts__F
--symbol_map ti_sysbios_family_c64p_EventCombiner_dispatch__E=ti_sysbios_family_c64p_EventCombiner_dispatch__F
--symbol_map xdc_runtime_System_sprintf_va__E=xdc_runtime_System_sprintf_va__F
--symbol_map ti_sdo_ipc_heaps_HeapBufMP_getStats__E=ti_sdo_ipc_heaps_HeapBufMP_getStats__F
--symbol_map ti_sdo_ipc_GateMP_createLocal__E=ti_sdo_ipc_GateMP_createLocal__F
--symbol_map ti_sysbios_gates_GateAll_query__E=ti_sysbios_gates_GateAll_query__F
--symbol_map xdc_runtime_SysStd_putch__E=xdc_runtime_SysStd_putch__F
--symbol_map ti_sdo_ipc_SharedRegion_resetInternalFields__E=ti_sdo_ipc_SharedRegion_resetInternalFields__F
--symbol_map xdc_runtime_Error_getData__E=xdc_runtime_Error_getData__F
--symbol_map xdc_runtime_Timestamp_get64__E=xdc_runtime_Timestamp_get64__F
--symbol_map xdc_runtime_Memory_alloc__E=xdc_runtime_Memory_alloc__F
--symbol_map xdc_runtime_SysStd_exit__E=xdc_runtime_SysStd_exit__F
--symbol_map ti_sysbios_gates_GateSwi_query__E=ti_sysbios_gates_GateSwi_query__F
--symbol_map ti_sdo_ipc_Ipc_dummy__E=ti_sdo_ipc_Ipc_dummy__F
--symbol_map xdc_runtime_SysStd_abort__E=xdc_runtime_SysStd_abort__F
--symbol_map xdc_runtime_SysStd_flush__E=xdc_runtime_SysStd_flush__F
--symbol_map xdc_runtime_Error_raiseX__E=xdc_runtime_Error_raiseX__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_getEventId__E=ti_sysbios_family_c66_tci66xx_CpIntc_getEventId__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_dispatch__E=ti_sysbios_family_c66_tci66xx_CpIntc_dispatch__F
--symbol_map ti_sysbios_family_c64p_EventCombiner_unused__E=ti_sysbios_family_c64p_EventCombiner_unused__F
--symbol_map ti_sdo_ipc_GateMP_attach__E=ti_sdo_ipc_GateMP_attach__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_clearSysInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_clearSysInt__F
--symbol_map ti_sysbios_xdcruntime_GateThreadSupport_query__E=ti_sysbios_xdcruntime_GateThreadSupport_query__F
--symbol_map xdc_runtime_Memory_getStats__E=xdc_runtime_Memory_getStats__F
--symbol_map xdc_runtime_Error_init__E=xdc_runtime_Error_init__F
--symbol_map xdc_runtime_SysStd_ready__E=xdc_runtime_SysStd_ready__F
--symbol_map xdc_runtime_Registry_findByName__E=xdc_runtime_Registry_findByName__F
--symbol_map xdc_runtime_GateNull_enter__E=xdc_runtime_GateNull_enter__F
--symbol_map xdc_runtime_Log_doPrint__E=xdc_runtime_Log_doPrint__F
--symbol_map xdc_runtime_Memory_getMaxDefaultTypeAlign__E=xdc_runtime_Memory_getMaxDefaultTypeAlign__F
--symbol_map xdc_runtime_Text_putLab__E=xdc_runtime_Text_putLab__F
--symbol_map xdc_runtime_Registry_getModuleId__E=xdc_runtime_Registry_getModuleId__F
--symbol_map xdc_runtime_Registry_findById__E=xdc_runtime_Registry_findById__F
--symbol_map ti_sdo_ipc_Notify_exec__E=ti_sdo_ipc_Notify_exec__F
--symbol_map ti_sdo_ipc_SharedRegion_start__E=ti_sdo_ipc_SharedRegion_start__F
--symbol_map xdc_runtime_knl_GateThread_leave__E=xdc_runtime_knl_GateThread_leave__F
--symbol_map xdc_runtime_Gate_enterSystem__E=xdc_runtime_Gate_enterSystem__F
--symbol_map xdc_runtime_Registry_getNextModule__E=xdc_runtime_Registry_getNextModule__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_enableAllHostInts__E=ti_sysbios_family_c66_tci66xx_CpIntc_enableAllHostInts__F
--symbol_map xdc_runtime_System_printf_va__E=xdc_runtime_System_printf_va__F
--symbol_map xdc_runtime_Text_cordText__E=xdc_runtime_Text_cordText__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_disableSysInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_disableSysInt__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_unused__E=ti_sysbios_family_c66_tci66xx_CpIntc_unused__F
--symbol_map xdc_runtime_Registry_getModuleName__E=xdc_runtime_Registry_getModuleName__F
--symbol_map ti_sdo_ipc_gates_GatePeterson_query__E=ti_sdo_ipc_gates_GatePeterson_query__F
--symbol_map ti_sdo_ipc_MessageQ_registerTransport__E=ti_sdo_ipc_MessageQ_registerTransport__F
--symbol_map ti_sysbios_xdcruntime_GateThreadSupport_enter__E=ti_sysbios_xdcruntime_GateThreadSupport_enter__F
--symbol_map ti_sdo_ipc_Notify_detach__E=ti_sdo_ipc_Notify_detach__F
--symbol_map xdc_runtime_Registry_findByNamePattern__E=xdc_runtime_Registry_findByNamePattern__F
--symbol_map ti_sdo_ipc_GateMP_openRegion0Reserved__E=ti_sdo_ipc_GateMP_openRegion0Reserved__F
--symbol_map ti_sysbios_gates_GateHwi_query__E=ti_sysbios_gates_GateHwi_query__F
--symbol_map xdc_runtime_Error_check__E=xdc_runtime_Error_check__F
--symbol_map ti_sdo_ipc_SharedRegion_clearReservedMemory__E=ti_sdo_ipc_SharedRegion_clearReservedMemory__F
--symbol_map xdc_runtime_System_vsprintf__E=xdc_runtime_System_vsprintf__F
--symbol_map xdc_runtime_System_exit__E=xdc_runtime_System_exit__F
--symbol_map xdc_runtime_Text_putSite__E=xdc_runtime_Text_putSite__F
--symbol_map ti_sdo_ipc_Ipc_setEntry__E=ti_sdo_ipc_Ipc_setEntry__F
--symbol_map xdc_runtime_Error_print__E=xdc_runtime_Error_print__F
--symbol_map xdc_runtime_System_asprintf_va__E=xdc_runtime_System_asprintf_va__F
--symbol_map xdc_runtime_Registry_addModule__E=xdc_runtime_Registry_addModule__F
--symbol_map ti_sdo_ipc_gates_GateMPSupportNull_query__E=ti_sdo_ipc_gates_GateMPSupportNull_query__F
--symbol_map xdc_runtime_Timestamp_getFreq__E=xdc_runtime_Timestamp_getFreq__F
--symbol_map xdc_runtime_Registry_isMember__E=xdc_runtime_Registry_isMember__F
--symbol_map xdc_runtime_Error_getCode__E=xdc_runtime_Error_getCode__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_postSysInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_postSysInt__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_enableSysInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_enableSysInt__F
--symbol_map ti_sdo_ipc_heaps_HeapMemMP_isBlocking__E=ti_sdo_ipc_heaps_HeapMemMP_isBlocking__F
--symbol_map xdc_runtime_GateNull_leave__E=xdc_runtime_GateNull_leave__F
--symbol_map xdc_runtime_Memory_free__E=xdc_runtime_Memory_free__F
--symbol_map xdc_runtime_Startup_rtsDone__E=xdc_runtime_Startup_rtsDone__F
--symbol_map ti_sysbios_syncs_SyncSem_signal__E=ti_sysbios_syncs_SyncSem_signal__F
--symbol_map xdc_runtime_Timestamp_get32__E=xdc_runtime_Timestamp_get32__F
--symbol_map ti_sysbios_gates_GateMutex_query__E=ti_sysbios_gates_GateMutex_query__F
--symbol_map xdc_runtime_System_aprintf_va__E=xdc_runtime_System_aprintf_va__F
--symbol_map ti_sysbios_family_c64p_EventCombiner_disableEvent__E=ti_sysbios_family_c64p_EventCombiner_disableEvent__F
--symbol_map xdc_runtime_Gate_leaveSystem__E=xdc_runtime_Gate_leaveSystem__F
--symbol_map ti_sdo_utils_MultiProc_getClusterId__E=ti_sdo_utils_MultiProc_getClusterId__F
--symbol_map xdc_runtime_Error_getMsg__E=xdc_runtime_Error_getMsg__F
--symbol_map xdc_runtime_Memory_valloc__E=xdc_runtime_Memory_valloc__F
--symbol_map ti_sdo_ipc_transports_TransportShmNotify_setErrFxn__E=ti_sdo_ipc_transports_TransportShmNotify_setErrFxn__F
--symbol_map ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E=ti_sysbios_family_c64p_EventCombiner_dispatchPlug__F
--symbol_map xdc_runtime_knl_GateThread_query__E=xdc_runtime_knl_GateThread_query__F
--symbol_map ti_sdo_ipc_Ipc_getEntry__E=ti_sdo_ipc_Ipc_getEntry__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_mapSysIntToHostInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_mapSysIntToHostInt__F
--symbol_map xdc_runtime_Diags_setMask__E=xdc_runtime_Diags_setMask__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_disableHostInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_disableHostInt__F
--symbol_map xdc_runtime_Text_ropeText__E=xdc_runtime_Text_ropeText__F
--symbol_map xdc_runtime_System_avprintf__E=xdc_runtime_System_avprintf__F
--symbol_map ti_sysbios_syncs_SyncSem_query__E=ti_sysbios_syncs_SyncSem_query__F
--symbol_map xdc_runtime_Error_getId__E=xdc_runtime_Error_getId__F
--symbol_map ti_sdo_ipc_MessageQ_unregisterTransport__E=ti_sdo_ipc_MessageQ_unregisterTransport__F
--symbol_map xdc_runtime_Error_getSite__E=xdc_runtime_Error_getSite__F
--symbol_map xdc_runtime_Memory_calloc__E=xdc_runtime_Memory_calloc__F
--symbol_map ti_sysbios_family_c66_tci66xx_CpIntc_enableHostInt__E=ti_sysbios_family_c66_tci66xx_CpIntc_enableHostInt__F
--symbol_map xdc_runtime_System_vprintf__E=xdc_runtime_System_vprintf__F
--symbol_map xdc_runtime_Text_putMod__E=xdc_runtime_Text_putMod__F
--symbol_map xdc_runtime_System_atexit__E=xdc_runtime_System_atexit__F
--symbol_map ti_sdo_ipc_GateMP_getSharedAddr__E=ti_sdo_ipc_GateMP_getSharedAddr__F



--args 0x0
-heap  0x0
-stack 0x1000

MEMORY
{
    L2SRAM (RWX) : org = 0x800000, len = 0x26000
    MSMCSRAM (RWX) : org = 0xc000000, len = 0x200000
    DDR (RWX) : org = 0x80000000, len = 0x200000
    DDR_1 (RWX) : org = 0x80200000, len = 0x4000000
    MSMCSRAM_1 (RWX) : org = 0xc200000, len = 0x100000
    MSMCSRAM_2 (RWX) : org = 0xc300000, len = 0x100000
    L2SRAM_1 (RWX) : org = 0x826000, len = 0x5a000
}

/*
 * Linker command file contributions from all loaded packages:
 */

/* Content from xdc.services.global (null): */

/* Content from xdc (null): */

/* Content from xdc.corevers (null): */

/* Content from xdc.shelf (null): */

/* Content from xdc.services.spec (null): */

/* Content from xdc.services.intern.xsr (null): */

/* Content from xdc.services.intern.gen (null): */

/* Content from xdc.services.intern.cmd (null): */

/* Content from xdc.bld (null): */

/* Content from ti.targets (null): */

/* Content from ti.targets.elf (null): */

/* Content from xdc.rov (null): */

/* Content from xdc.runtime (null): */

/* Content from ti.targets.rts6000 (null): */

/* Content from ti.sysbios.interfaces (null): */

/* Content from ti.sysbios.family (null): */

/* Content from ti.sysbios (null): */

/* Content from xdc.services.getset (null): */

/* Content from ti.sysbios.hal (null): */

/* Content from ti.sysbios.knl (null): */

/* Content from ti.sysbios.gates (null): */

/* Content from xdc.runtime.knl (null): */

/* Content from ti.sdo.ipc.family (null): */

/* Content from ti.sdo.ipc.interfaces (null): */

/* Content from ti.sysbios.syncs (null): */

/* Content from ti.sysbios.family.c66 (null): */

/* Content from ti.sysbios.family.c64p (null): */

/* Content from ti.sysbios.family.c66.tci66xx (null): */

/* Content from ti.sysbios.xdcruntime (null): */

/* Content from ti.sysbios.family.c62 (null): */

/* Content from ti.sysbios.timers.timer64 (null): */

/* Content from ti.sysbios.family.c64p.tci6488 (null): */

/* Content from ti.sysbios.heaps (null): */

/* Content from ti.sysbios.utils (null): */

/* Content from ti.catalog.c6000 (null): */

/* Content from ti.catalog (null): */

/* Content from ti.catalog.peripherals.hdvicp2 (null): */

/* Content from xdc.platform (null): */

/* Content from xdc.cfg (null): */

/* Content from ti.platforms.generic (null): */

/* Content from custom.vlfft.evmc6678l.core0 (null): */

/* Content from ti.sdo.utils (null): */

/* Content from ti.sdo.ipc.nsremote (null): */

/* Content from ti.sdo.ipc.heaps (null): */

/* Content from ti.sdo.ipc (ti/sdo/ipc/linkcmd.xdt): */

SECTIONS
{
    ti.sdo.ipc.SharedRegion_0:  { . += 0x200000;} run > 0xc000000, type = NOLOAD
}


/* Content from ti.sdo.ipc.transports (null): */

/* Content from ti.sdo.ipc.gates (null): */

/* Content from ti.sdo.ipc.family.c647x (null): */

/* Content from ti.sdo.ipc.notifyDrivers (null): */

/* Content from configPkg (null): */


/*
 * symbolic aliases for static instance objects
 */
xdc_runtime_Startup__EXECFXN__C = 1;
xdc_runtime_Startup__RESETFXN__C = 1;
TSK_idle = ti_sysbios_knl_Task_Object__table__V + 0;

SECTIONS
{
    .text: load >> MSMCSRAM_1
    .ti.decompress: load > MSMCSRAM_1
    .stack: load > L2SRAM
    GROUP: load > L2SRAM
    {
        .bss:
        .neardata:
        .rodata:
    }
    .cinit: load > L2SRAM
    .pinit: load >> L2SRAM
    .init_array: load > L2SRAM
    .const: load >> L2SRAM
    .data: load >> L2SRAM
    .fardata: load >> L2SRAM
    .switch: load >> L2SRAM
    .sysmem: load > L2SRAM
    .far: load >> L2SRAM
    .args: load > L2SRAM align = 0x4, fill = 0 {_argsize = 0x0; }
    .cio: load >> L2SRAM
    .ti.handler_table: load > L2SRAM
    .internalMEM: run >> L2SRAM_1
    .externalMEM: run >> DDR_1
    .sharedMEM: run >> MSMCSRAM_2
    .vecs: load >> MSMCSRAM_1
    xdc.meta: load >> L2SRAM, type = COPY

}
