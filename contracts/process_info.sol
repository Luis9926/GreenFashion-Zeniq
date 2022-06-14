pragma solidity >=0.4.22 <0.9.0;

contract process_info {

    constructor(){
        createHiloProcess(1,"CHINA",1000,100);
    }

    struct Hilo{
        string origen;
        uint date;
        uint sustainability;

        bool isValue;
    }

    struct Tela{
        string origen;
        uint date;
        uint sustainability;

        bool isValue;
    }

    struct Pintura{
        string origen;
        uint date;
        uint sustainability;
        uint agua;

        bool isValue;
    }
    struct Acabado{
        string origen;
        uint date;
        uint sustainability;
        uint energia;

        bool isValue;
    }

    struct Producto{
        uint product_id;
        uint validations_aquired;
        bool isCertifiable;

        bool isValue;
    }

    mapping (uint => Hilo) public hiloProcess;
    mapping (uint => Tela) public telaProcess;
    mapping (uint => Pintura) public pinturaProcess;
    mapping (uint => Acabado) public acabadoProcess;

    mapping (uint => Producto) public productos;

    function checkIfCertifiable(uint key) public {
        if(productos[key].isValue && productos[key].validations_aquired == 4){
            productos[key].isCertifiable = true;
        }else{
            revert("Product not found");
        }
    }

    function createHiloProcess(uint _key,string memory _origen,uint _date,uint _sustainability) public{
        hiloProcess[_key] = 
            Hilo(_origen,_date,_sustainability,true
        );
        productos[_key] = Producto(_key,1,false,true);
    }

    function createTelaProcess(uint key,string memory origen,uint date,uint sustainability) public{
        telaProcess[key] =  Tela(
            origen,date,sustainability,true
        );
    }

    function createPinturaProcess(uint key,string memory origen,uint date,uint sustainability, uint agua) public{
        pinturaProcess[key] =  Pintura(
            origen,date,sustainability,agua,true
        );
    }
        
    function createAcabadoProcess(uint key,string memory origen,uint date,uint sustainability, uint energia) public{
        acabadoProcess[key] =  Acabado(
            origen,date,sustainability,energia,true
        );
        checkIfCertifiable(key);
    }

    function readHilo(uint _id) public view returns (string memory,uint,uint){
        uint index;
        if(hiloProcess[_id].isValue){
            index = _id;
            return (hiloProcess[index].origen,hiloProcess[index].sustainability,hiloProcess[index].date);
        }else{
            revert("Task not found");
        }     
    }

    function readPintura(uint _id) public view returns (string memory,uint,uint,uint){
        uint index;
        if(pinturaProcess[_id].isValue){
            index = _id;
            return (pinturaProcess[index].origen,pinturaProcess[index].sustainability,pinturaProcess[index].date,pinturaProcess[index].agua);
        }else{
            revert("Task not found");
        }
           
    }

    function readTela(uint _id) public view returns (string memory,uint,uint){
        uint index;
        if(telaProcess[_id].isValue){
            index = _id;
            return (telaProcess[index].origen,telaProcess[index].sustainability,telaProcess[index].date);
        }else{
            revert("Task not found");
        }
           
    }

    function readAcabado(uint _id) public view returns (string memory,uint,uint,uint){
        uint index;
        if(acabadoProcess[_id].isValue){
            index = _id;
            return (acabadoProcess[index].origen,acabadoProcess[index].sustainability,acabadoProcess[index].date,acabadoProcess[index].energia);
        }else{
            revert("Task not found");
        }
    }


    


}