pragma solidity >=0.4.22 <0.9.0;

contract process_info {


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
    }

    struct Pintura{
        string origen;
        uint date;
        uint sustainability;
        uint agua;
    }
    struct Acabado{
        string origen;
        uint date;
        uint sustainability;
        uint energia;
    }

    struct Producto{
        uint product_id;
        uint validations_aquired;
        bool isCertifiable;
    }

    mapping (uint => Hilo) public hiloProcess;
    mapping (uint => Tela) public telaProcess;
    mapping (uint => Pintura) public pinturaProcess;
    mapping (uint => Acabado) public acabadoProcess;

    mapping (uint => Producto) public productos;


    function createHiloProcess(uint _key,string memory _origen,uint _date,uint _sustainability) public{
        
        hiloProcess[_key] = 
            Hilo(_origen,_date,_sustainability,true
        );



    }

    // function createTelaProcess(uint key,string memory origen,uint date,uint sustainability) public{
    //     telaProcess[key] =  Tela(
    //         origen,date,sustainability
    //     );
    // }

    // function createPinturaProcess(uint key,string memory origen,uint date,uint sustainability, uint agua) public{
    //     pinturaProcess[key] =  Pintura(
    //         origen,date,sustainability,agua
    //     );
    // }
        
    // function createAcabadoProcess(uint key,string memory origen,uint date,uint sustainability, uint energia) public{
    //     acabadoProcess[key] =  Acabado(
    //         origen,date,sustainability,energia
    //     );
    // }
    

    function checkIfCertifiable() public {

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


}