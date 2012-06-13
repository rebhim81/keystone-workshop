

SECTIONS
{

 
	
    .init_array:    load >> L2SRAM
    .srioSharedMem: load >> MSMCSRAM
    .qmss:          load >> MSMCSRAM
    .cppi:          load >> MSMCSRAM
    
    
    .twiddleFactor:       >      DDR3
    .twiddleFactor2:      >      DDR3
    .twiddleFactor3:      >      DDR3
    .fftInput:           >       DDR3

        
     
}

