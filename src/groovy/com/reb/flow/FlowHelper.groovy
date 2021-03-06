package com.reb.flow

class FlowHelper {
    String currentSF
    List<String> sequence
    String flowType
    def flow

    FlowHelper(def flowArg) {
        flow = flowArg
    }

    static FlowHelper getInstance(def flowArg){
        FlowHelper flowHelper = new FlowHelper(flowArg)
    }

    int getCurrentSFNumber() {
        int index = sequence.indexOf(currentSF)
        return (index == -1) ? 0 : index
    }

    String next() {
        int index = sequence.indexOf(currentSF) + 1
        if (index == sequence.size()) {
            throw new Exception("No Subflow after $currentSF")
        }
        currentSF = sequence.get(index)
        currentSF
    }

    String previous() {
        int index = sequence.indexOf(currentSF)
        if (index == 0) {
            throw new Exception("No Subflow before $currentSF")
        }
        if (index == -1) {
            throw new Exception("Current subflow not a part of sequence")
        }
        currentSF = sequence.get(index - 1)
        currentSF
    }
}
