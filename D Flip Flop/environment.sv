`include "transaction.sv"
`include "generator.sv"	
`include "driver.sv"	
`include "monitor.sv"	
`include "scoreboard.sv"	

class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  
  mailbox gen2drv;
  mailbox mon2scr;
  
  event mainframe;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    
    this.vif = vif;
    
    gen2drv = new();
    mon2scr = new();
    
    gen = new(gen2drv);
    drv = new(vif,gen2drv);
    mon = new(vif,mon2scr);
    scr = new(mon2scr);
    
    gen.main_frame = mainframe;
    scr.main_frame = mainframe;
    
  endfunction
  
    
    task test_run();
      
      fork 
        
        gen.main();
        drv.main();
        mon.main();
        scr.main();        
        
      join
      
    endtask 
    
endclass
