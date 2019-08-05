[condition][]There is a computer identified by {$computer}={$computer} : Computer()
[condition][]Sum all processes {requiredResource} that exceeded the {resource} in {$computer} and call it {$total}=accumulate(\n
            Process(\n
                computer == {$computer},\n
                $required : {requiredResource});\n
            {$total} : sum($required);\n
            {$total} > {$computer}.{resource} )
[consequence][]Update {resource} of {$computer} hard score with {$total}=scoreHolder.addHardConstraintMatch(kcontext, {$computer}.{resource} - {$total});
[consequence][]Update {$computer} soft score with {cost}=scoreHolder.addSoftConstraintMatch(kcontext, -{$computer}.{cost});