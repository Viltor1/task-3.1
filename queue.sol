pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract queue {
            string[] public queueArray;
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }


        function adding(string value) public {
                queueArray.push(value);
                tvm.accept();
    }


        function call() public {
            if (queueArray.empty()) {
                revert(103,'Queue is empty');
            }
            else  {
                for(uint i = 0; queueArray.length - 1 > i ; i++) {
                    queueArray[i]= queueArray[i+1];
                }
                queueArray.pop();
            }
            tvm.accept();

    }

}
