function out = AnalyzeFang(subject, session)

load ([subject, '_' , num2str(session)])

th = [params.questParams.maxC*10^QuestQuantile(history{1}.q,0.5)...
    params.questParams.maxC*10^QuestQuantile(history{2}.q,0.5)...
    params.questParams.maxC*10^QuestQuantile(history{3}.q,0.5)...
    params.questParams.maxC*10^QuestQuantile(history{4}.q,0.5)...
    params.questParams.maxC*10^QuestQuantile(history{5}.q,0.5)];

ub = [params.questParams.maxC*10^QuestQuantile(history{1}.q,0.975)...
    params.questParams.maxC*10^QuestQuantile(history{2}.q,0.975)...
    params.questParams.maxC*10^QuestQuantile(history{3}.q,0.975)...
    params.questParams.maxC*10^QuestQuantile(history{4}.q,0.975)...
    params.questParams.maxC*10^QuestQuantile(history{5}.q,0.975)];

lb = [params.questParams.maxC*10^QuestQuantile(history{1}.q,0.025)...
    params.questParams.maxC*10^QuestQuantile(history{2}.q,0.025)...
    params.questParams.maxC*10^QuestQuantile(history{3}.q,0.025)...
    params.questParams.maxC*10^QuestQuantile(history{4}.q,0.025)...
    params.questParams.maxC*10^QuestQuantile(history{5}.q,0.025)];

out.th = th;
out.ub = ub;
out.lb = lb;


errorbar(params.stimParams.testTilt,th,[ub-lb]/2)